# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
# (no custom nodes required)

# download models into comfyui
ENV CVT="8894b6af3f93a899ba9d2f268ddc45aa"

RUN apt-get update && apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /comfyui/models/checkpoints

RUN curl --fail --retry 5 --retry-max-time 0 -C - -L -H "Authorization: Bearer ${CVT}" \
    -o /comfyui/models/checkpoints/pornmaster_proSDXLV7.safetensors \
    "https://civitai.com/api/download/models/2043971?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    
# RUN comfy model download --url https://huggingface.co/frankjoshua/realvisxlV50_v50LightningBakedvae/resolve/main/realvisxlV50_v50LightningBakedvae.safetensors --relative-path models/checkpoints --filename realvisxlV50_v50LightningBakedvae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
