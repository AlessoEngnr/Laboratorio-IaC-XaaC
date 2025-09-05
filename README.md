# Laboratorio IaC XaaC

Este laboratorio tiene como objetivo implementar un entorno de infraestructura como código (**IaC**) utilizando **Terraform** y el **proveedor de Docker**. Se despliegan varios contenedores (Nginx, Postgres, Redis y Grafana), organizados en redes y volúmenes para simular un escenario real de aplicaciones con persistencia de datos y monitoreo.

---

## Requisitos previos

Asegúrese de contar con lo siguiente antes de iniciar:

- Docker instalado y en ejecución.
- Terraform versión 1.0 o superior.
- Ubuntu 24.04.2 LTS (o compatible).
- Acceso a terminal y permisos de administrador.

---

## Estructura del proyecto

- **main.tf**: Definición de recursos Docker (redes, volúmenes, contenedores).
- **variables.tf**: Parámetros de imágenes, credenciales y puertos.
- **outputs.tf**: Muestra información útil tras el despliegue (accesos, IPs, etc).
- **.terraform.lock.hcl**: Bloqueo de versiones del proveedor.
- **.gitignore**: Archivos excluidos del repositorio.

---

## Pasos para la ejecución

1. **Clonar el repositorio**
   ```bash
   git clone <url-del-repo>
   cd Laboratorio-IaC-XaaC
   ```

2. **Inicializar Terraform**
   ```bash
   terraform init
   ```

3. **Previsualizar los cambios**
   ```bash
   terraform plan
   ```

4. **Aplicar la infraestructura**
   ```bash
   terraform apply
   ```
   Confirme con `yes` cuando lo solicite.

5. **Verificar los recursos creados**
   ```bash
   docker ps
   docker network ls
   docker volume ls
   ```

---

## Acceso a los servicios

- **Nginx**
  - app1: [http://localhost:8001](http://localhost:8001)
  - app2: [http://localhost:8002](http://localhost:8002)
  - app3: [http://localhost:8003](http://localhost:8003)

- **Postgres**
  - Puerto: 5432
  - Usuario, contraseña y base de datos: definidos en `variables.tf`.

- **Redis**
  - Puerto: 6379

- **Grafana**
  - Dashboard: [http://localhost:3000](http://localhost:3000)
  - Usuario y contraseña por defecto: `admin` / `admin`

---

## Eliminación de la infraestructura

Para eliminar todos los recursos creados:

```bash
terraform destroy
```
Confirme con `yes` cuando lo solicite.

---

## Notas finales

- Los datos de **Postgres** se almacenan en el volumen `pg_data`.
- Las credenciales están centralizadas en `variables.tf`.
- **Postgres** y **Redis** se encuentran en la red `persistence_net`.
- **Nginx** y **Grafana** se conectan a la red `app_net`.
- Puede consultar los accesos y endpoints ejecutando:
  ```bash
  terraform output
  ```

---

## Referencias

- [Documentación oficial de Terraform](https://developer.hashicorp.com/terraform/docs)
- [Documentación oficial de Docker](https://docs.docker.com/)
- [Documentación oficial de Grafana](https://grafana.com/docs/)

