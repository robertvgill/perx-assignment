{{/*
Returns the name of the application.
*/}}
{{- define "trades.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Returns the full name of the application.
*/}}
{{- define "trades.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{/*
Returns the selector labels for the application.
*/}}
{{- define "trades.selectorLabels" -}}
app.kubernetes.io/name: {{ include "trades.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Returns the standard labels for the application.
*/}}
{{- define "trades.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "trades.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

