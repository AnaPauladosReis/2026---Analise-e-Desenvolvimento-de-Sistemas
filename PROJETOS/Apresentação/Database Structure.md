# **Database Structure**

This presentation outlines the database structure for the Helpdesk system, focusing on key entities and their relationships.  
---

## **Core Entities**

* **Users (Usuários):** Stores information about system users.  
*  `id_usuario` : Primary key.  
*  `nome` : User's name.  
*  `email` : User's email address.  
*  `senha` : User's password.  
*  `telefone` : User's phone number.  
*  `cpf` : User's CPF (Brazilian taxpayer registry ID).  
*  `tipo_usuario` : Type of user (e.g., admin, client).


## **Ticket Management (Chamados)**

* **Tickets (Chamados):** Manages customer support requests.  
*  `id_chamado` : Primary key.  
*  `id_usuario` : Foreign key referencing the user who opened the ticket.  
*  `titulo` : Ticket title.  
*  `descricao` : Detailed description of the issue.  
*  `data_abertura` : Date the ticket was opened.  
*  `status` : Current status of the ticket (e.g., open, pending, closed).  
*  `prioridade` : Ticket priority.  
*  `protocolo` : Unique protocol number for the ticket.


## **Ticket Interactions**

* **Ticket Responses (RespostasChamado):** Records replies to tickets.  
*  `id_resposta` : Primary key.  
*  `id_chamado` : Foreign key referencing the ticket.  
*  `id_usuario` : Foreign key referencing the user who responded.  
*  `resposta` : The content of the response.  
*  `data_resposta` : Date and time of the response.  
* **Ticket Attachments (AnexosChamado):** Stores information about files attached to tickets.  
*  `id_anexo` : Primary key.  
*  `id_chamado` : Foreign key referencing the ticket.  
*  `nome_arquivo` : Name of the attached file.  
*  `caminho_arquivo` : Path to the stored file.


## **System Administration & Configuration**

* **System Logs (LogsSistema):** Records system events and activities.  
*  `id_log` : Primary key.  
*  `data_hora` : Timestamp of the event.  
*  `descricao_log` : Description of the logged event.  
* **Database Backups (BackupsBanco):** Tracks database backup operations.  
*  `id_backup` : Primary key.  
*  `data_backup` : Date of the backup.  
*  `caminho_backup` : Path to the backup file.


## **Dashboard Data**


* Number of open tickets.  
* Tickets by status or priority.  
* Recent ticket activity.  
* Graphical representations of ticket data.
