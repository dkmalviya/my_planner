// To parse this JSON data, do
//
//     final registrationErrorResponse = registrationErrorResponseFromJson(jsonString);

import 'dart:convert';

RegistrationErrorResponse registrationErrorResponseFromJson(String str) => RegistrationErrorResponse.fromJson(json.decode(str));

String registrationErrorResponseToJson(RegistrationErrorResponse data) => json.encode(data.toJson());

class RegistrationErrorResponse {
	RegistrationErrorResponse({
		required this.status,
		required this.error,
		required this.message,
		required this.timestamp,
	});

	String status;
	int error;
	String message;
	String timestamp;

	factory RegistrationErrorResponse.fromJson(Map<String, dynamic> json) => RegistrationErrorResponse(
		status: json["status"],
		error: json["error"],
		message: json["message"],
		timestamp: json["timestamp"],
	);

	Map<String, dynamic> toJson() => {
		"status": status,
		"error": error,
		"message": message,
		"timestamp": timestamp,
	};
}
