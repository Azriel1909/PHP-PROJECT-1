## PROYECTO CRUD 
Elaborado por Ximena Toledo

## ARQUITECTURA
![alt](img/1.png)

## REQUISITOS
1. Tener instalado Apache
2. Tener instalado PHP
3. Tener instalado MySql

> Nota importante: Si instalas XAMPP, no hay necesidad de instalar Apache Y MySql.

## COMANDOS 
---

### 1. Instalando XAMPP


Cambiando los permisos del instalador

```bash
chmod 755 xampp-linux-*-installer.run
```

Ejecutar el instalador

```bash
sudo ./xampp-linux-*-installer.run
```

### 2. Permisos de carpetas

```bash
sudo chown -R usuario:grupo /opt/lampp/htdocs
```

Alternativa
```bash
sudo chown 2775 /opt/lampp/htdocs
```
### 3. Iniciar XAMPP

```bash
sudo /opt/lampp/lampp start
```

Detener XAMPP
```bash
sudo /opt/lampp/lampp stop
```

### VIDEO DEMOSTRACIÓN

[UI and CRUD Projet Link](https://www.youtube.com/watch?v=napVQnr9JB8&ab_channel=TOLEDORIVERAXIMENAA)
