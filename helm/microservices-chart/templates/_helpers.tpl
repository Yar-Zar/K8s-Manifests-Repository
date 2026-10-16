{{/* Helper templates for common labels and names */}}
{{- define "microservices-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "microservices-chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "microservices-chart.name" . -}}
{{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "microservices-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end -}}

{{- define "microservices-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- printf "%s-%s" (include "microservices-chart.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- default "" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
