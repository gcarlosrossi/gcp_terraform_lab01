# 🧪 Laboratorio 01 - Implementación Serverless en GCP 🚀

Este laboratorio tiene como objetivo implementar una arquitectura **Serverless moderna, automatizada y escalable** en **Google Cloud Platform (GCP)** utilizando **Terraform** como herramienta de Infraestructura como Código (IaC).  
Se incluye la exposición de APIs, ejecución de funciones sin servidor, persistencia en Firestore y automatización con GitHub Actions.


## 📚 Tabla de Contenido

1. 🧩 [Arquitectura Objetivo](#arquitectura- Previos
3. ⚙️ Pasos del Laboratorio
4. 🧱 Estructura del Repositorio
5. 🔐 Buenas Prácticas
6. 🧪 Tecnologías y Herramientas


---


## 🧩 Arquitectura Objetivo

La arquitectura propuesta está compuesta por los siguientes componentes:

- **Api Gateway** → Exposición y gestión de APIs.  
- **Cloud Functions** → Lógica de negocio sin servidor (serverless).  
- **Firestore** → Base de datos NoSQL nativa de GCP.  
- **Terraform** → Despliegue y gestión de infraestructura declarativa.  
- **GitHub Actions** → CI/CD para automatizar el despliegue.  
- **Postman** → Pruebas funcionales y validación de endpoints.

![Arquitectura Objetivo](./assets/ARQ-LAB01-ARQUITECTURA%20OBJETIVO.png)

---

## ⚙️ Pasos del Laboratorio

   **Preparación del Entorno**
   - Instalación de Terraform, GCloud CLI y autenticación en GCP.
   - Configuración de proyecto y credenciales.

      **🐍 Instalación de Python (Requisito para Scripts del Lab)**

      Algunos scripts del laboratorio requieren Python 3.10 o superior. A continuación se detallan los pasos para instalarlo según el sistema operativo:

      **🔧 Windows**

      - Descarga el instalador desde python.org/downloads.
      - Ejecuta el instalador y **marca la opción "Add Python to PATH"**.
      - Haz clic en **"Install Now"**.
      - Verifica la instalación:
         ```bash
         python --version


   **Estructura del Proyecto Base Terraform**
      - Organización modular (carpetas `assets/`, `environments/`, `functions/`,`modules/`,`main.tf`, etc.).

   **Desarrollo de Módulos**
      - Módulo para Api Gateway
      - Módulo para Cloud Functions
      - Módulo para Firestore

   **Despliegue de Infraestructura**
      - Ejecución de los comandos:
      ```bash
      terraform init
      terraform plan
      terraform apply
      ```

   **Pruebas Funcionales**
      - Validación de endpoints mediante Postman.

   **Observabilidad y Seguridad**
      - Configuración de logs y métricas en Cloud Logging y Cloud Monitoring.
      - Reglas IAM mínimas necesarias.

---

## 🧱 Estructura del Repositorio

   ```bash
   GCP_TERRAFORM_LAB01/
   │
   ├── .github/workflows/
   │   └── ci-cd.yml
   │
   ├── assets/
   │   └── ARQ-LAB01-ARQUITECTURA OBJETIVO.png
   │
   ├── environments/
   │   ├── dev.tf
   │   └── prod.tf
   │
   ├── functions/
   │   ├── create/
   │   │ └── main.py
   │   ├── delete/
   │   │ └── main.py
   │   ├── read/
   │   │ └── main.py
   │   ├── shared/
   │   │ └── mainrequirements.txt
   │   └── update/
   │     └── main.py
   │
   ├── modules/
   │   ├── api-gateway/
   │   │ ├── api-gateway.tf
   │   │ ├── api-key.tf
   │   │ ├── openapi.yaml
   │   │ ├── outputs.tf
   │   │ └── variables.tf
   │   ├── cloud-functions/
   │   │ ├── archives.tf
   │   │ ├── bucket.tf
   │   │ ├── functions.tf
   │   │ ├── iam.tf
   │   │ ├── outputs.tf
   │   │ ├── service_accounts.tf
   │   │ └── variables.tf
   │   └── firestore/
   │     ├── firestore.tf
   │     ├── outputs.tf
   │     └── variables.tf
   │
   ├── .gitignore
   ├── apis.tf
   ├── backend.tf
   ├── main.tf
   ├── outputs.tf
   ├── provider.tf
   ├── README.md
   ├── variables.tf
   └── versions.tf
   ```

   ---

## 🔐 Buenas Prácticas

   - Uso de **Remote Backend (GCS)** para el estado de Terraform.  
   - Versionamiento de módulos.  
   - Aplicación de **principio de menor privilegio (PoLP)**.  
   - Automatización del pipeline con **GitHub Actions**.

---

## 🧪 Tecnologías y Herramientas

| Herramienta | Descripción |
|--------------|-------------|
| Terraform | IaC para gestionar la infraestructura |
| GCP | Plataforma cloud principal |
| Api Gateway | Gestión de APIs |
| Cloud Functions | Ejecución de funciones sin servidor |
| Firestore | Base de datos NoSQL |
| GitHub Actions | CI/CD automatizado |
| Postman | Pruebas funcionales |

---

## 👨‍💻 Autores

   **[Gregorovichz Carlos Rossi]**  
   Chapter Lead - Arquitecto de Soluciones Expert
   📧 [gregorovichz.carlos@rimac.com.pe]  

   **[Kevin Chagua Callupe]**  
   Arquitecto de Soluciones Specialist
   📧 [kevin.chaguac@rimac.com.pe]  

---

© 2025 - Proyecto Architecture Academy | RIMAC - Laboratorio Serverless
