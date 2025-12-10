# Sistema de Gestión de Proyectos

Aplicación web completa para gestión de proyectos empresariales con frontend React y backend Node.js + MySQL.

## 🚀 Inicio Rápido

### Opción 1: Con Docker (Recomendado)

#### Requisitos
- Docker y Docker Compose instalados

#### Pasos

1. **Iniciar todos los servicios:**
   ```bash
   docker-compose up --build
   ```

2. **Abrir en el navegador:**
   - Frontend: http://localhost:5173
   - API: http://localhost:4000/api
   - MySQL: localhost:3307

**¡Eso es todo!** Docker creará automáticamente la base de datos, las tablas y los datos de prueba.

### Opción 2: Sin Docker (Desarrollo Local)

#### Requisitos
- Node.js 18+
- MySQL 8.0+ (instalado y corriendo)

#### Pasos

1. **Clonar e instalar dependencias:**
   ```bash
   # Backend
   cd backend
   npm install
   
   # Frontend (en otra terminal)
   cd frontend
   npm install
   ```

2. **Configurar MySQL:**
   ```bash
   # Conectarse a MySQL
   mysql -u root -p
   
   # Crear la base de datos
   CREATE DATABASE intermodular CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   
   
   # Salir
   \q
   ```

3. **Configurar variables de entorno:**
   
   El backend ya tiene un archivo `.env` configurado. Si necesitas cambiar algo:
   ```bash
   cd backend
   # Editar .env con tus credenciales de MySQL si son diferentes
   ```

4. **Inicializar la base de datos:**
   ```bash
   cd backend
   npm run init-db
   ```

5. **Iniciar los servidores:**
   
   Terminal 1 - Backend:
   ```bash
   cd backend
   npm run dev
   ```
   
   Terminal 2 - Frontend:
   ```bash
   cd frontend
   npm run dev
   ```

6. **Abrir en el navegador:**
   - Frontend: http://localhost:5173
   - API: http://localhost:4000/api



## 📁 Estructura del Proyecto

```
Intermodular/
├── backend/              # API REST Node.js + Express
│   ├── config/          # Configuración de base de datos
│   ├── controllers/     # Lógica de negocio
│   ├── db/              # Esquemas SQL y seeds
│   ├── middleware/      # Autenticación JWT
│   ├── models/          # Modelos de datos
│   ├── routes/          # Rutas de la API
│   ├── scripts/         # Scripts de utilidad
│   └── server.js        # Servidor principal
│
└── frontend/            # Aplicación React + Vite
    ├── public/          # Archivos estáticos
    └── src/
        ├── api/         # Configuración de axios
        ├── components/  # Componentes React
        ├── pages/       # Páginas de la aplicación
        ├── App.jsx      # Componente principal
        └── main.jsx     # Punto de entrada
```

## 🔐 Usuarios de Prueba

Después de inicializar la base de datos, puedes usar estos usuarios:

| Email | Password | Rol |
|-------|----------|-----|
| admin@test.com | admin123 | admin |
| maria@test.com | admin123 | project_manager |
| juan@test.com | admin123 | developer |

## 🎯 Funcionalidades

### Implementadas
- ✅ Autenticación con JWT
- ✅ CRUD de Proyectos
- ✅ CRUD de Clientes
- ✅ CRUD de Personal/Equipo
- ✅ CRUD de Tareas
- ✅ Dashboard con resumen
- ✅ Control de acceso basado en roles
- ✅ Diseño responsive

### Permisos por Rol

- **Usuarios no autenticados**: Pueden ver proyectos, clientes, personal y tareas
- **Usuarios autenticados**: Pueden crear, editar y eliminar proyectos, clientes, personal y tareas
- **Admin**: Acceso completo a todas las funcionalidades

## 📚 API Endpoints

### Autenticación
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/register` - Registrar usuario
- `GET /api/auth/me` - Obtener perfil (requiere token)

### Proyectos
- `GET /api/proyectos` - Listar proyectos
- `GET /api/proyectos/:id` - Ver proyecto
- `POST /api/proyectos` - Crear proyecto (🔒 requiere auth)
- `PUT /api/proyectos/:id` - Actualizar proyecto (🔒 requiere auth)
- `DELETE /api/proyectos/:id` - Eliminar proyecto (🔒 requiere auth)

### Clientes
- `GET /api/clientes` - Listar clientes
- `POST /api/clientes` - Crear cliente (🔒 requiere auth)
- `PUT /api/clientes/:id` - Actualizar cliente (🔒 requiere auth)
- `DELETE /api/clientes/:id` - Eliminar cliente (🔒 requiere auth)

### Personal
- `GET /api/personal` - Listar personal
- `POST /api/personal` - Crear personal (🔒 requiere auth)
- `PUT /api/personal/:id` - Actualizar personal (🔒 requiere auth)
- `DELETE /api/personal/:id` - Eliminar personal (🔒 requiere auth)

### Tareas
- `GET /api/tareas` - Listar tareas
- `GET /api/tareas/proyecto/:id` - Tareas de un proyecto
- `POST /api/tareas` - Crear tarea (🔒 requiere auth)
- `PUT /api/tareas/:id` - Actualizar tarea (🔒 requiere auth)
- `DELETE /api/tareas/:id` - Eliminar tarea (🔒 requiere auth)

## 🛠️ Tecnologías Utilizadas

### Backend
- Node.js + Express
- MySQL 8.0
- JWT para autenticación
- bcrypt para encriptación
- CORS habilitado

### Frontend
- React 19
- Vite
- React Router
- Axios
- CSS moderno con variables

## 🐛 Troubleshooting

### El frontend muestra pantalla en blanco
1. Verifica que el backend esté corriendo en puerto 4000
2. Abre la consola del navegador (F12) para ver errores
3. Verifica que el archivo `.env` en frontend tenga `VITE_API_URL=http://localhost:4000/api`

### Error de conexión a MySQL
1. Verifica que MySQL esté corriendo (o Docker si usas docker-compose)
2. Comprueba las credenciales en `backend/.env`:
   - DB_HOST=localhost
   - DB_PORT=3307 (si usas Docker) o 3306 (si es local)
   - DB_USER=root
   - DB_PASSWORD=password123
3. Asegúrate de que la base de datos `intermodular` existe

### Error "Cannot find module"
```bash
# En backend
cd backend
npm install

# En frontend
cd frontend
npm install
```

### Reiniciar la base de datos
```bash
cd backend
npm run init-db
```

## 📝 Notas de Desarrollo

- El backend corre en puerto 4000
- El frontend corre en puerto 5173
- CORS está habilitado para desarrollo
- Los tokens JWT expiran en 24 horas
- Las contraseñas se encriptan con bcrypt

## 🔜 Próximas Mejoras

- [ ] Configuración Docker completa
- [ ] Tests unitarios y de integración
- [ ] Paginación en listados
- [ ] Filtros y búsqueda avanzada
- [ ] Subida de archivos/imágenes
- [ ] Notificaciones en tiempo real
- [ ] Exportación a PDF/Excel
- [ ] Dashboard con gráficos

## 👥 Equipo

Proyecto desarrollado por 4 estudiantes de ASIR (Administración de Sistemas Informáticos en Red).

## 📄 Licencia

Este proyecto es de uso educativo.
