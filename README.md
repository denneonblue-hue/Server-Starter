# Server Starter

![Skript in Aktion](img/1.png)

### 💡 Motivation & Ziel
Ich habe vor ein paar Tagen einen Metin2 Server zum Üben und Testen aufgesetzt. Damit ich nicht jedes Mal VirtualBox manuell starten, dort die Logindaten und noch einige andere Befehle eingeben muss, damit der Server komplett online geht, habe ich dieses kleine Skript geschrieben. Es automatisiert den gesamten Prozess von der Virtualisierungsebene bis zum Start der Anwendungsdienste – ein klassisches Beispiel für **Infrastructure-as-Code** im kleinen Maßstab.

### 🛠️ Eingesetzte Technologien & Skills
* **Scripting:** Batch / CMD
* **Virtualisierung:** VirtualBox CLI (`VBoxManage.exe`)
* **Netzwerk & Sicherheit:** SSH-Protokoll, Public-Key-Authentifizierung (RSA)
* **Prozesssteuerung:** Automatisierte Ausführung von Shell-Commands (FreeBSD/tcsh) auf Remote-Systemen.

---

## ⚙️ Kernfunktionen
* **Intelligenter VM-Start:** Das Skript prüft über `errorlevel`-Abfragen, ob die virtuelle Maschine bereits läuft, um redundante Startversuche und Fehler zu vermeiden.
* **Headless-Steuerung via SSH:** Loggt sich eigenständig auf dem FreeBSD-System ein und initialisiert die Server-Prozesse (`game; m2`).
* **Status-Feedback:** Sauberes Konsolen-Feedback mit Timestamps (`%time%`) für leichtes Monitoring.

## 🚀 Systemvoraussetzungen
1. **Oracle VirtualBox** (Standardpfad vorausgesetzt).
2. **Windows 10/11** mit aktiviertem OpenSSH-Client.
3. **SSH-Schlüsselpaar (RSA)** für den passwortlosen Login.

## 🔑 Setup: SSH-Key (Login ohne Passwort)

Damit die Automatisierung nicht durch Passwortabfragen blockiert wird, muss der Windows-Host am FreeBSD-Server authentifiziert werden.

**1. Key generieren (Windows PowerShell):**

```bash
ssh-keygen -t rsa -b 4096
```

**Hinweis:** Bestätige alle Abfragen mit **Enter** und vergebe kein Passwort, damit das Skript vollautomatisch laufen kann.

**2. Public Key auf den Server übertragen:**

```bash
ssh-copy-id root@192.168.178.55
```

*Alternativ:* Kopiere den Inhalt deiner `id_rsa.pub` manuell in die Datei `/root/.ssh/authorized_keys` auf deinem Server.

---

## 📦 Installation & Nutzung
1. **Datei vorbereiten:** Lade die Datei `Server_Start.bat` herunter.
2. **Konfiguration:** Öffne die Datei in einem Texteditor und passe die Variablen an:
   * `SERVER_IP`: Die IP deines lokalen Servers.
   * `VM_NAME`: Der Name der Maschine in VirtualBox.
3. **Start:** Führe die `.bat`-Datei einfach mit einem Doppelklick aus.

---
*Entwickelt von denneonblue – Fokus auf pragmatische IT-Lösungen und Prozessautomatisierung.*
