# Server Starter

![Skript in Aktion](img/1.png)
<img width="1115" height="628" alt="3" src="https://github.com/user-attachments/assets/1c4541c5-87d1-4a9d-996d-1f654757cb58" />

# Metin2 Server Start-Skript

Ein einfaches Batch-Skript, das eine VirtualBox-VM im Hintergrund startet und anschließend die Server-Dienste über SSH hochfährt.

### Motivation & Ziel
Ich habe mir einen Metin2 Server zum Üben und Testen aufgesetzt. Da es auf Dauer nervig ist, jedes Mal VirtualBox manuell zu öffnen, die VM zu starten, zu warten und dann per Hand die Login-Daten sowie die Startbefehle einzutippen, habe ich diesen Ablauf automatisiert. Das Skript übernimmt den kompletten Startprozess vom Klick in Windows bis zum fertigen Server-Dienst.

### Eingesetzte Technologien & Skills
* **Scripting:** Windows Batch (CMD) mit erweiterter Errorlevel-Validierung
* **Virtualisierung:** Oracle VirtualBox CLI (VBoxManage.exe) für Headless-Operationen
* **Netzwerk & Sicherheit:** OpenSSH-Protokoll, Public-Key-Authentifizierung (RSA)
* **Prozesssteuerung:** Automatisierte Remote-Ausführung von Shell-Befehlen (FreeBSD / tcsh) und MariaDB/SQL-Diensten

---

## Kernfunktionen
* **Zustandsprüfung der Virtualisierung:** Das Skript prüft vor der Ausführung den Zustand der VM via CLI, um redundante Startversuche oder Systemkonflikte proaktiv zu verhindern.
* **Headless-Betrieb:** Die virtuelle Maschine wird ressourcenschonend im Hintergrund (Headless-Modus) gestartet.
* **Automatisierte Remote-Initialisierung:** Nach erfolgreichem Netzwerk-Handshake erfolgt der passwortlose Login auf dem FreeBSD-System, um die Server- und Datenbank-Prozesse (`game; m2`) autonom zu starten.
* **Protokollierung & Monitoring:** Jede Phase des Boot- und Startvorgangs wird mit präzisen Zeitstempeln (`%time%`) in der Konsole ausgegeben, um ein transparentes Logging zu gewährleisten.

## Systemvoraussetzungen
1. **Oracle VirtualBox** (Standardpfad vorausgesetzt).
2. **Windows 10/11** mit nativem OpenSSH-Client.
3. **SSH-Schlüsselpaar (RSA)** für den passwortlosen Login.

## Setup: SSH-Key (Login ohne Passwort)

Um eine unterbrechungsfreie Automatisierung zu gewährleisten, muss die Authentifizierung über ein kryptografisches Schlüsselpaar statt über eine interaktive Passworteingabe erfolgen.

**1. Key generieren (Windows PowerShell):**

```powershell
ssh-keygen -t rsa -b 4096
```

**Hinweis:** Bestätige alle Abfragen mit **Enter** und vergebe kein Passwort, damit das Skript vollautomatisch laufen kann.

**2. Public Key auf den Server übertragen:**

```bash
ssh-copy-id root@HIER IP EINGEBEN
```

*Alternativ:* Kopiere den Inhalt deiner `id_rsa.pub` manuell in die Datei `/root/.ssh/authorized_keys` auf deinem Server.

---

## Installation & Nutzung

1. **Datei vorbereiten:** Lade die Datei `Server_Start.bat` herunter.
2. **Konfiguration:** Öffne die Datei in einem Texteditor und passe die Variablen im Kopfbereich an:
   * `SERVER_IP`: Die IP-Adresse Ihres FreeBSD-Servers.
   * `VM_NAME`: Der exakte Name der virtuelle Maschine innerhalb von VirtualBox.
3. **Start:** Führe die `.bat`-Datei einfach mit einem Doppelklick aus.

---
*Entwickelt von denneonblue – Systemnahe Automatisierung und Infrastruktur-Integrität im praktischen Einsatz.*
