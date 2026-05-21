# Módulo Legacy - Usuarios (Grupo C)

## Arquitectura CI/CD e IaC Implementada

Este proyecto moderniza el despliegue de un microservicio legacy en Node.js, implementando las siguientes prácticas DevOps:

* **Integración Continua (CI):** Configurada en GitHub Actions para ejecutarse sobre la rama `develop`. Valida el código fuente usando Node.js 20 y ejecuta pruebas automatizadas antes de generar el artefacto.
* **Infraestructura como Código (IaC):** Orquestada con Terraform mediante una arquitectura modular (`network` y `compute`). Utiliza un backend remoto en S3 para la gestión del estado.
* **Despliegue Continuo (CD):** Pipeline que reacciona a cambios en la rama `main`, asumiendo credenciales temporales de AWS Academy y aplicando la infraestructura automáticamente. El servidor EC2 (Amazon Linux 2023) se aprovisiona mediante un script `user_data` que instala dependencias y asegura la persistencia del proceso usando PM2.
* **Seguridad y GitOps:** El Security Group está restringido a una única IP pública (/32) y la instancia escalada (t3.micro), modificaciones aplicadas estrictamente a través de control de versiones.

## URL de Validación en Vivo

La aplicación se encuentra desplegada y respondiendo exitosamente en el puerto asignado (8000):

**http://[190.104.20.154]:8000**