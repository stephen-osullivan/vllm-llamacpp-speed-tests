install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

docker-vllm: 
	docker run --gpus=all -v ~/.cache/huggingface:/models -e HF_HOME=/models -p 8000:8000 \
		vllm/vllm-openai:latest --model solidrust/Meta-Llama-3-8B-Instruct-hf-AWQ  --quantization awq --max-model-len 1024