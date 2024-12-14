# Variables
URL = http://localhost:8080/query?limit=1&offset=3
HEADER = 'Content-Type: application/json'
DATA = '{"symbol": "BTCUSDT", "unix": "", "foo": 1}'
CONCURRENT_REQUESTS = 50
DURATION = 60

.PHONY: loadtest

loadtest:
	@echo "Starting load test for $(DURATION) seconds with $(CONCURRENT_REQUESTS) concurrent connections..."
	@start_time=$$(date +%s); \
	while [ $$(($$(date +%s) - $$start_time)) -lt $(DURATION) ]; do \
		seq $(CONCURRENT_REQUESTS) | xargs -n 1 -P $(CONCURRENT_REQUESTS) -I {} \
		curl --silent --location --request GET "$(URL)" --header "$(HEADER)" --data "$(DATA)" -o /dev/null && \
		echo "Request completed"; \
	done

