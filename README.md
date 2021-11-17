# Matrix Addition

Step 1: We need to switch our runtime from CPU to GPU. Click on Runtime > Change runtime type > Hardware Accelerator > GPU > Save.

Step 2: Completely uninstall any previous CUDA versions.We need to refresh the Cloud Instance of CUDA.
  !apt-get --purge remove cuda nvidia* libnvidia-*
  !dpkg -l | grep cuda- | awk '{print $2}' | xargs -n1 dpkg --purge
  !apt-get remove cuda-*
  !apt autoremove
  !apt-get update
  
Step 3: Install CUDA Version 9.
  !wget https://developer.nvidia.com/compute/cuda/9.2/Prod/local_installers/cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64 -O cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64.deb
  !dpkg -i cuda-repo-ubuntu1604-9-2-local_9.2.88-1_amd64.deb
  !apt-key add /var/cuda-repo-9-2-local/7fa2af80.pub
  !apt-get update
  !apt-get install cuda-9.2

Step 4: Now you can check your CUDA installation by running the command given below :
  !nvcc --version
  
Step 7: Execute the code.
  !nvcc Matrix.cu
