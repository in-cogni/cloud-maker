.PHONY: run clean

run:
	chmod +x run.sh
	./run.sh test-vm 1024

clean:
	chmod +x cleanup.sh
	./cleanup.sh test-vm
