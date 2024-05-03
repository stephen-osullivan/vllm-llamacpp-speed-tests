install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

docker-vllm: 
	docker run --gpus=all -v ~/.cache/huggingface:/models -e HF_HOME=/models -p 8000:8000 \
		vllm/vllm-openai:latest --model solidrust/Meta-Llama-3-8B-Instruct-hf-AWQ  --quantization awq --max-model-len 1024

docker-llamacpp:
	docker run --gpus=all -v /home/sos00/models:/models -p 8000:8000 \
		ghcr.io/ggerganov/llama.cpp:server-cuda --port 8000 --host 0.0.0.0 --model models/Meta-Llama-3-8B-Instruct-Q5_K_M.gguf -n 1024 \
		--n-gpu-layers 33

docker-llamacpp-continuous-batching:
	docker run --gpus=all -v /home/sos00/models:/models -p 8000:8000 \
		ghcr.io/ggerganov/llama.cpp:server-cuda --port 8000 --host 0.0.0.0 --model models/Meta-Llama-3-8B-Instruct-Q5_K_M.gguf -n 1024 \
		--n-gpu-layers 33 -cb -np 4