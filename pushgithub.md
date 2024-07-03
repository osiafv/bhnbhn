 git config --global --remove-section user
    git config --global --remove-section credential
    git remote remove origin
    git config --global user.user "osiafv"
    git config --global user.email "skyzbott@gmail.com"
    git config --global user.password "Risky132"
    git config user.password "Risky132"
    git config --global credential.helper store
    git init
    git add .
    git commit -m "new" 
    git branch -m main
    git remote add origin https://github.com/osiafv/bhnbhn.git
    git push -u origin main