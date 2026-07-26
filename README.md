# Scripting Bash

Mis herramientas en el lenguaje Bash.

> **Aviso:** Todas las herramientas están destinadas exclusivamente a fines educativos y a su utilización en entornos propios o con autorización explícita.

---

### PortScan

Una herramienta en Bash alternativa a nmap para casos especificos en los que dicha herramienta no sea tan beneficiosa.

Example:

```bash
chmod +x PortScan.sh
./PortScan.sh <Ip-Address>
```

---

### HostDiscovery

Una herramienta en Bash para descubrir dispositivos conectados a la Red Local.

Example (Muy importante no poner NADA al final y dejar un punto como ultimo caracter):
```bash
chmod +x hostDiscovery.sh
./hostDiscovery.sh 192.168.100.
```

---

### Subdomain

Una herramienta en bash que facilita el uso de GoBuster para el descubrimiento de subdominios de manera activa.

Example (El unico parametro obligatorio es '-u', cada uno tiene una configuracion Default):

```bash
chmod +x subdomain.sh
./subdomain -u https://target.com -w **Wordlists*** -t 'threads' -f 'filters'
```
