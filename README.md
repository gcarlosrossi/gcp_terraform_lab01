   # Laboratorio 01 - Implementación Serverless 🚀

Este proyecto tiene como objetivo implementar una **arquitectura Serverless** en **Google Cloud Platform (GCP)** utilizando **Terraform** como herramienta de Infraestructura como Código (IaC).  
La solución implementa una arquitectura moderna, automatizada y escalable para el despliegue de componentes serverless y APIs gestionadas.

---

## 🧩 Arquitectura Objetivo

La arquitectura propuesta está compuesta por los siguientes componentes:

- **Apigee API Platform** → Exposición y gestión de APIs.  
- **Cloud Functions** → Lógica de negocio sin servidor (serverless).  
- **Firestore** → Base de datos NoSQL nativa de GCP.  
- **Terraform** → Despliegue y gestión de infraestructura declarativa.  
- **GitHub Actions** → CI/CD para automatizar el despliegue.  
- **Postman** → Pruebas funcionales y validación de endpoints.

![Arquitectura Objetivo](./assets/ARQ-LAB01-ARQUITECTURA%20OBJETIVO.png)

---

## ⚙️ Pasos del Laboratorio

1. **Preparación del Entorno**
   - Instalación de Terraform, GCloud CLI y autenticación en GCP.
   - Configuración de proyecto y credenciales.

2. **Estructura del Proyecto Base Terraform**
   - Organización modular (carpetas `modules/`, `environments/`, `main.tf`, etc.).

3. **Desarrollo de Módulos**
   - Módulo para Apigee
   - Módulo para Cloud Functions
   - Módulo para Firestore

4. **Despliegue de Infraestructura**
   - Ejecución de los comandos:
     ```bash
     terraform init
     terraform plan
     terraform apply
     ```

5. **Pruebas Funcionales**
   - Validación de endpoints mediante Postman.

6. **Observabilidad y Seguridad**
   - Configuración de logs y métricas en Cloud Logging y Cloud Monitoring.
   - Reglas IAM mínimas necesarias.

---

## 🧱 Estructura del Repositorio

```bash
terraform-serverless-lab/
│
├── modules/
│   ├── apigee/
│   ├── cloud-functions/
│   └── firestore/
│
├── environments/
│   ├── dev/
│   └── prod/
│
├── .github/workflows/
│   └── ci-cd.yml
│
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── arquitectura_objetivo.png
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
| Apigee | Gestión de APIs |
| Cloud Functions | Ejecución de funciones sin servidor |
| Firestore | Base de datos NoSQL |
| GitHub Actions | CI/CD automatizado |
| Postman | Pruebas funcionales |

---

## 👨‍💻 Autor

**[Gregorovichz Carlos Rossi]**  
Chapter Lead - Arquitecto de Soluciones Expert
📧 [cgregorovichz@gmail.com]  
🌐 [https://github.com/gcarlosrossi](https://github.com/gcarlosrossi)

---

© 2025 - Proyecto Architecture Academy | RIMAC - Laboratorio Serverless
