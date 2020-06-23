import subprocess, sys


def execute_tmsl(server: str, cred: str, database: str, tmsl: str):
    command_tmsl = f"""
            Invoke-ASCmd `
                -Server {server} `
                -Credential {cred} `
                -Database {database} `
                -Query ({tmsl} | ConvertTo-Json -Depth 25)
    """

    make_run_scritps = 'Set-ExecutionPolicy RemoteSigned'

    p = subprocess.Popen(["powershell.exe", 
                        make_run_scritps], 
                        stdout=sys.stdout)
    p.communicate()

    p = subprocess.Popen(["powershell.exe", 
                        command_tmsl], 
                        stdout=sys.stdout)
    p.communicate()
