CONDA_ENV_NAME="mapperatorinator"
PROJECT_DIR="/var/mnt/ssd/Files/Programming/libs/mapperatorinator/Mapperatorinator"
CONDA_SH_PATH="$HOME/miniconda3/etc/profile.d/conda.sh"

# exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Mapperatorinator ---"

# 1. Source the Conda script to make `conda activate` available
if [ -z "$CONDA_SH_PATH" ]; then
    # Try to find conda.sh using `conda info --base`
    # This requires `conda` to be in the PATH already for the subshell finding it.
    # If `conda init` has been run, this usually works.
    __conda_setup_target_path="$(conda info --base)/etc/profile.d/conda.sh"
    if [ -f "$__conda_setup_target_path" ]; then
        CONDA_SH_PATH="$__conda_setup_target_path"
        echo "Found conda.sh at: $CONDA_SH_PATH"
    else
        echo "Error: conda.sh not found using 'conda info --base'."
        echo "Please set CONDA_SH_PATH manually in the script."
        exit 1
    fi
elif [ ! -f "$CONDA_SH_PATH" ]; then
    echo "Error: CONDA_SH_PATH is set, but file not found: $CONDA_SH_PATH"
    echo "Please correct the CONDA_SH_PATH in the script."
    exit 1
fi

echo "Sourcing Conda environment script: $CONDA_SH_PATH"
# shellcheck source=/dev/null
# The SC1090 warning can be ignored if we trust CONDA_SH_PATH.
# For dynamic paths, it's safer but ShellCheck can't verify it.
# We are checking if the file exists above.
source "$CONDA_SH_PATH"

# 2. Activate the Conda environment
echo "Activating Conda environment: $CONDA_ENV_NAME"
conda activate "$CONDA_ENV_NAME"
if [ $? -ne 0 ]; then
    echo "Error: Failed to activate Conda environment '$CONDA_ENV_NAME'."
    echo "Make sure the environment exists."
    exit 1
fi
echo "Active environment: $CONDA_DEFAULT_ENV"

# 3. Change directory to the project folder
echo "Changing directory to: $PROJECT_DIR"
cd "$PROJECT_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to change directory to '$PROJECT_DIR'."
    echo "Make sure the path is correct."
    exit 1
fi
echo "Current directory: $(pwd)"

# 4. Run the Python script
echo "Running python web-ui.py..."
# If your web-ui.py takes arguments, add them here:
# python web-ui.py --arg1 value1 --arg2 value2
python web-ui.py

# When web-ui.py exits (e.g., you press Ctrl+C), the script will continue here.
echo "--- Web UI Script Finished ---"

# Optional: Deactivate conda environment
# conda deactivate
# echo "Conda environment deactivated."

exit 0