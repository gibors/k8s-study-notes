cat << 'EOF' > cka_cheat_sheet.txt
# ==========================================
# CKA IMPERATIVE COMMANDS CHEAT SHEET
# ==========================================

# --- MINUTE-ONE SETUP ---
alias k=kubectl
export do="--dry-run=client -o yaml"
export now="--grace-period=0 --force"

# --- PODS ---
k run my-pod --image=nginx                         # Create simple pod
k run my-pod --image=nginx $do > pod.yaml          # Generate Pod YAML
k run my-pod --image=nginx --labels="env=prod"     # Pod with labels
k run test-pod --image=busybox --rm -it -- restart=Never -- wget -O- IP

# --- DEPLOYMENTS & SCALING ---
k create deploy my-deploy --image=nginx            # Create deployment
k create deploy my-deploy --image=nginx $do > d.yaml # Generate Deploy YAML
k scale deploy my-deploy --replicas=3              # Scale up/down
k set image deploy my-deploy nginx=nginx:1.18.0    # Rolling update

# --- SERVICES & NETWORKING ---
k expose pod my-pod --port=80 --target-port=8000   # Expose Pod (ClusterIP)
k expose deploy my-deploy --port=80 --type=NodePort# Expose Deploy (NodePort)
k create svc clusterip my-svc --tcp=80:8000        # Create Service directly

# --- CONFIGURATION & SECURITY ---
k create cm my-config --from-literal=key1=val1     # ConfigMap
k create secret generic my-sec --from-literal=p=12 # Secret
k create sa my-sa                                  # ServiceAccount
k create role my-role --verb=get,list --resource=pods # Role
k create rolebinding my-bind --role=my-role --serviceaccount=default:my-sa

# --- TROUBLESHOOTING ---
k get pods -A                                      # All pods, all namespaces
k logs my-pod                                      # Check logs
k logs my-pod --previous                           # Logs of crashed pod
k describe pod my-pod                              # Find pending/fail reasons
k describe node worker-1                           # Node details
k api-resources                                    # Find resource shortnames
EOF