rest_host=142.93.30.221:8082
consumer_name=consumer_test
topic=test

# initialize 
curl -X POST -H "Content-Type: application/vnd.kafka.v2+json" \
      --data '{"name": "'$consumer_name'", "format": "json", "auto.offset.reset": "earliest"}' \
      $rest_host/consumers/my_json_consumer
# expected response
# {"instance_id":"my_consumer_instance", "base_uri":"http://localhost:8082/consumers/my_json_consumer/instances/my_consumer_instance"}

# subscribe
curl -X POST -H "Content-Type: application/vnd.kafka.v2+json" --data '{"topics":["'$topic'"]}' \
	  $rest_host/consumers/my_json_consumer/instances/$consumer_name/subscription
# expected response
# No content in response -> should print out if topic does not exist

echo

# consume
curl -X GET -H "Accept: application/vnd.kafka.json.v2+json" \
      $rest_host/consumers/my_json_consumer/instances/$consumer_name/records
# expected response
# [{"key":null,"value":{"foo":"bar"},"partition":0,"offset":0,"topic":"test"}]

# delete
curl -X DELETE -H "Content-Type: application/vnd.kafka.v2+json" \
      $rest_host/consumers/my_json_consumer/instances/$consumer_name
# expected response
# No content in response

