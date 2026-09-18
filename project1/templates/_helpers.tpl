# project name
{{- define "project1.name" -}}
{{- default .Chart.name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

# project fullname
{{- defind "project1.fullname" -}}
{{- if .Values.fullnameOverrride }}
{{ .Values.fullnameOverrride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "project1.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

# helm.sh/chart
{{-define "project1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

# Common labels
{{- define "project1.labels" -}}
helm.sh/chart: {{- include "project1.chart" . }}
app.kubernetes.io/part-of: Project1
app.kubernetes.io/managed-by: Helm
app.kubernetes.io/created-by: pdev
{{- end -}}

