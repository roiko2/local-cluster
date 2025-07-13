# Webapp Helm Chart

A reusable Helm chart for web applications that display pod information.

## 🎯 **Why This Approach is Better**

### ✅ **No Code Duplication**
- Single chart for all web applications
- Shared templates and logic
- Easy maintenance and updates

### ✅ **Organized Structure**
```
charts/webapp/
├── Chart.yaml              # Chart metadata
├── values.yaml             # Default values
├── values-app1.yaml        # App1 specific values
├── values-app2.yaml        # App2 specific values
├── templates/
│   ├── deployment.yaml     # Smart template with style support
│   ├── service.yaml        # Service configuration
│   ├── ingress.yaml        # Ingress rules
│   └── _helpers.tpl        # Common template functions
└── README.md               # This file
```

### ✅ **Flexible Styling**
The chart supports multiple styles via `app.style`:
- **simple**: Basic HTML
- **styled**: Enhanced with CSS styling
- **modern**: Modern gradient design

## 🚀 **Usage**

### Deploy App1 (Simple Style)
```bash
helm install app1 ./charts/podinfo-webapp -f charts/podinfo-webapp/values-app1.yaml
```

### Deploy App2 (Styled)
```bash
helm install app2 ./charts/podinfo-webapp -f charts/podinfo-webapp/values-app2.yaml
```

### Deploy with Custom Values
```bash
helm install myapp ./charts/podinfo-webapp \
  --set app.name="myapp" \
  --set app.style="modern" \
  --set ingress.hosts[0].host="myapp.local"
```

## 📋 **Configuration**

### App Configuration
```yaml
app:
  name: "podinfo-webapp"        # Application name
  version: "1.0.0"      # Application version
  style: "simple"       # Style: simple, styled, modern
```

### Deployment Configuration
```yaml
replicaCount: 2
image:
  repository: busybox
  tag: latest
```

### Ingress Configuration
```yaml
ingress:
  enabled: true
  hosts:
    - host: podinfo-webapp.local
      paths:
        - path: /
          pathType: Prefix
```

## 🎨 **Available Styles**

### Simple Style
- Basic HTML structure
- Minimal styling
- Fast loading

### Styled Style
- Light blue background
- Card-based layout
- Enhanced typography

### Modern Style
- Gradient background
- Modern card design
- Responsive layout

## 🔧 **Customization**

### Add New Style
1. Edit `templates/deployment.yaml`
2. Add new style condition in the HTML generation
3. Update `values.yaml` with new style option

### Add New Application
1. Create new values file (e.g., `values-app3.yaml`)
2. Configure app name, version, and style
3. Deploy with new values file

## 📊 **Benefits**

- **DRY Principle**: Don't Repeat Yourself
- **Maintainability**: Single source of truth
- **Consistency**: Same structure across apps
- **Flexibility**: Easy to customize per app
- **Scalability**: Easy to add new applications 