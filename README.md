# infra-snippets
 
## Jupyter on Compute Node

1. `pip install jupyter` in your virtual environment.
2. Jupyter notebook should be run with the IP of the compute node 
```bash
jupyter notebook --ip $(hostname -f) --no-browser
```
3. Connect your VS Code ipykernel to the Jupyter server with the URL outputed at your terminal. Example URL of GPU node
`http://ng12345.narval.calcul.quebec:6789/tree?token=*****` 
4. Run `!nvidia-smi` from a Jupyter cell to see your GPU hardware stats.


#### SSH Tunneling (Optional)
You can also connect a local Jupyter notebook located on your own computer to the remote compute node using a VPN. The [official documentation](https://docs.alliancecan.ca/wiki/JupyterNotebook) recommends a Python package called `sshuttle`.

1. `pip install sshuttle` within a virtual environment on your local machine.
2. Establish VPN connection at your terminal 
```bash
sshuttle --dns -Nr <your_user_name>@narval.computecanada.ca
```
3. Once connected, set local `ipynb` kernel to remote Jupyter server URL as usual (step 3 and 4 above).