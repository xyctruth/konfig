import base.pkg.kusion_models.kube.frontend.rbac

rbac.ClusterRole {
    name = "clickhouse-operator-kube-system"
    labels = {
        "clickhouse.altinity.com/chop" = "0.19.2"
    }
    rules = [
        {
            apiGroups = [""]
            resources = ["configmaps", "services"]
            verbs = ["get", "list", "patch", "update", "watch", "create", "delete"]
        }
        {
            apiGroups = [""]
            resources = ["endpoints"]
            verbs = ["get", "list", "watch"]
        }
        {
            apiGroups = [""]
            resources = ["events"]
            verbs = ["create"]
        }
        {
            apiGroups = [""]
            resources = ["persistentvolumeclaims"]
            verbs = ["get", "list", "patch", "update", "watch", "delete"]
        }
        {
            apiGroups = [""]
            resources = ["persistentvolumes", "pods"]
            verbs = ["get", "list", "patch", "update", "watch"]
        }
        {
            apiGroups = ["apps"]
            resources = ["statefulsets"]
            verbs = ["get", "list", "patch", "update", "watch", "create", "delete"]
        }
        {
            apiGroups = ["apps"]
            resources = ["replicasets"]
            verbs = ["get", "patch", "update", "delete"]
        }
        {
            apiGroups = ["apps"]
            resourceNames = ["clickhouse-operator"]
            resources = ["deployments"]
            verbs = ["get", "patch", "update", "delete"]
        }
        {
            apiGroups = ["policy"]
            resources = ["poddisruptionbudgets"]
            verbs = ["get", "list", "patch", "update", "watch", "create", "delete"]
        }
        {
            apiGroups = ["clickhouse.altinity.com"]
            resources = ["clickhouseinstallations"]
            verbs = ["get", "patch", "update", "delete"]
        }
        {
            apiGroups = ["clickhouse.altinity.com"]
            resources = ["clickhouseinstallations", "clickhouseinstallationtemplates", "clickhouseoperatorconfigurations"]
            verbs = ["get", "list", "watch"]
        }
        {
            apiGroups = ["clickhouse.altinity.com"]
            resources = ["clickhouseinstallations/finalizers", "clickhouseinstallationtemplates/finalizers", "clickhouseoperatorconfigurations/finalizers"]
            verbs = ["update"]
        }
        {
            apiGroups = ["clickhouse.altinity.com"]
            resources = ["clickhouseinstallations/status", "clickhouseinstallationtemplates/status", "clickhouseoperatorconfigurations/status"]
            verbs = ["get", "update", "patch", "create", "delete"]
        }
        {
            apiGroups = [""]
            resources = ["secrets"]
            verbs = ["get", "list"]
        }
        {
            apiGroups = ["apiextensions.k8s.io"]
            resources = ["customresourcedefinitions"]
            verbs = ["get", "list"]
        }
    ]
}

rbac.ClusterRoleBinding {
    metadata = {
        name = "clickhouse-operator-kube-system"
        labels = {
            "clickhouse.altinity.com/chop" = "0.19.2"
        }
    }
    roleRef = {
        apiGroup = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
        name = "clickhouse-operator-kube-system"
    }
    subjects = [
        {
            kind = "ServiceAccount"
            name = "clickhouse-operator"
            namespace = "kube-system"
        }
    ]
}
