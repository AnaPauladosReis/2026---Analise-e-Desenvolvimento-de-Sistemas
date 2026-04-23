<?php
/**
 * painel/funcoes/crypto.php
 * Criptografia reversível para dados sensíveis (AES-256-GCM)
 */

function smtp_encrypt(string $plaintext): string {
    $plaintext = (string)$plaintext;
    if ($plaintext === '') return '';

    $keyHex = defined('SMTP_SECRET_KEY') ? SMTP_SECRET_KEY : '';
    if ($keyHex === '' || strlen($keyHex) !== 64) {
        throw new RuntimeException('SMTP_SECRET_KEY inválida (precisa ter 64 chars hex).');
    }

    $key = hex2bin($keyHex);
    if ($key === false || strlen($key) !== 32) {
        throw new RuntimeException('SMTP_SECRET_KEY não pôde ser convertida.');
    }

    $iv = random_bytes(12); // GCM: 12 bytes recomendado
    $tag = '';

    $cipher = openssl_encrypt(
        $plaintext,
        'aes-256-gcm',
        $key,
        OPENSSL_RAW_DATA,
        $iv,
        $tag,
        '',
        16
    );

    if ($cipher === false) {
        throw new RuntimeException('Falha ao criptografar.');
    }

    // armazena: base64(iv|tag|cipher)
    return base64_encode($iv . $tag . $cipher);
}

function smtp_decrypt(string $encoded): string {
    $encoded = (string)$encoded;
    if ($encoded === '') return '';

    $keyHex = defined('SMTP_SECRET_KEY') ? SMTP_SECRET_KEY : '';
    if ($keyHex === '' || strlen($keyHex) !== 64) {
        throw new RuntimeException('SMTP_SECRET_KEY inválida (precisa ter 64 chars hex).');
    }

    $key = hex2bin($keyHex);
    if ($key === false || strlen($key) !== 32) {
        throw new RuntimeException('SMTP_SECRET_KEY não pôde ser convertida.');
    }

    $data = base64_decode($encoded, true);
    if ($data === false || strlen($data) < (12 + 16 + 1)) {
        throw new RuntimeException('Valor criptografado inválido.');
    }

    $iv    = substr($data, 0, 12);
    $tag   = substr($data, 12, 16);
    $cipher= substr($data, 28);

    $plain = openssl_decrypt(
        $cipher,
        'aes-256-gcm',
        $key,
        OPENSSL_RAW_DATA,
        $iv,
        $tag,
        ''
    );

    if ($plain === false) {
        throw new RuntimeException('Falha ao descriptografar (tag/chave inválida).');
    }

    return $plain;
}
