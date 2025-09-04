# Laboratorio IaC XaaC

Este tarea tiene como objetivo implementar un entorno de laboratorio utilizando **Terraform** junto con el **proveedor de Docker**. La infraestructura se compone de varios contenedores (Nginx, Postgres y Redis), organizados en redes y volúmenes para simular un escenario real de aplicaciones con persistencia de datos y monitoreo.



## Requisitos previos

Antes de ejecutar el proyecto, es necesario contar con lo siguiente:  
- Docker instalado y en ejecución.  
- Terraform versión 1.0 o superior.  
- Un sistema operativo compatible, como **Ubuntu 24.04.2 LTS**.  


## Estructura del proyecto

- **main.tf** → contiene la definición de los recursos de Docker (redes, volúmenes y contenedores).  
- **variables.tf** → archivo donde se parametrizan las imágenes, credenciales y puertos.  
- **.terraform.lock.hcl** → asegura el bloqueo de versiones del proveedor.  
- **.gitignore** → lista de archivos que no se deben subir al repositorio.  



## Pasos para la ejecución

1. **Clonar el repositorio**  
   ```bash
   git clone <url-del-repo>
   cd <carpeta-del-proyecto>
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
   Confirmar con `yes` cuando lo solicite.

5. **Verificar los contenedores y recursos creados**  
   ```bash
   docker ps
   docker network ls
   docker volume ls
   ```



## Acceso a los servicios

- **Nginx**  
  - app1: [http://localhost:8001](http://localhost:8001)  
  - app2: [http://localhost:8002](http://localhost:8002)  
  - app3: [http://localhost:8003](http://localhost:8003)  

- **Postgres**  
  - Puerto: **5432**  
  - Usuario, contraseña y base de datos: definidos en `variables.tf`.  

- **Redis**  
  - Puerto: **6379**



## Eliminación de la infraestructura

En caso se desee eliminar todo lo creado, basta con ejecutar:  

```bash
terraform destroy
```

Y confirmar con `yes`.  



## Notas finales

- Los datos de **Postgres** se almacenan en el volumen `pg_data`.  
- Las credenciales están centralizadas en `variables.tf`.  
- **Postgres y Redis** se encuentran en la red `persistence_net`.  
- **Nginx** se conecta a la red `app_net`.  



## Referencias

- [Documentación oficial de Terraform](https://developer.hashicorp.com/terraform/docs)  
- [Documentación oficial de Docker](https://docs.docker.com/)  
