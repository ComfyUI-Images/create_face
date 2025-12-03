# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
# (no custom nodes required)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/frankjoshua/realvisxlV50_v50LightningBakedvae/resolve/main/realvisxlV50_v50LightningBakedvae.safetensors --relative-path models/checkpoints --filename realvisxlV50_v50LightningBakedvae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
