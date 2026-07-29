Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DCE3B584F
	for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303460; cv=none; b=rwhQ8KjdRFRX415WRI6OdL+J5L6+f/dNHPcwSxmeURuIk3vBf1il4k504eZytenbYOEvfC7JvOgApuaTkXnXYTfzsDLTzQXv6XkgT5gJtyFc8zguXr1hR7y710SVYFsyct9JhN9d4Nrw8c7IIV4UxO74WVIk263PUXymSdvyPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303460; c=relaxed/simple;
	bh=81WsicO1lnWvPSZw1fn2UG+k9M3g0LSPZQa9sgz45IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtfXqDZ7K2Cs84yj3THuRtzXj4aRXSWOvRUySQns+lgf0J97sIa+jj4GtNLxj9LCHbLbd9z8Gy+/rG1SBz8iahzeuTi68xveFjEpLPJpdMJ3HdxBrP+T0DEIHHZPgD29D+ta5DN/6qGIlncHMB6GDVjWKuLl8VmLRTppXTMEE2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbRv1ZmL; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbRv1ZmL"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-495efdede87so8287b6e.2
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303458; x=1785908258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYEwKBiTcuHNpwjMLcTcd5LYOpcHXXSayMJQAf1r+NQ=;
        b=PbRv1ZmLo/yySgbgFDgYTTCGmhTdZ5EGkMte8u6zSqwrCuLFRkLJU0vpiNlt/F0hnw
         ce3LE2+uzJWk1jDJlYGUD+QCN1SvgWIETyZGmVTWaoSrxt695sOYI8CaUgUhyyBgf4ge
         dGlOVq9z+7Wzjlhj/OHQl5SD9MAJwAdWecsu6HJR8qXIAdTH9ODwNrJTwnlWhlhHp3+c
         xjaQZTQrWNqzz8uig86c6j53HHudDUhhhGU/FHqYNXLj1IMwK+rRz6GfMAOQjMk/1CMM
         8/tk3iaUCkEqiGgFoGoYLQ6kjcwQ0ktFANEE0yE3hY6ZynCEh8oaz6EbotnJaG8vqM/+
         sCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303458; x=1785908258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYEwKBiTcuHNpwjMLcTcd5LYOpcHXXSayMJQAf1r+NQ=;
        b=k3AddtfkI1P7gw2IuriXnYw53gPUFRpjq/K/9RlzuR7/6nZzjIoYQRuP7rXsxqZhel
         NGolstp7NYYwRgCrCaQSmbmZfnOk4hqbjf2W3lRxl+auSYeG7Dzo93sLVinDzK94NWbs
         kz4SE0SFirZTG0Ag0WJ7v3ooCYW5uZ/cza9ZmgcFl3s9EAIiNllOccPLnfhPi1JTO5+v
         wATNJHMB1xhTM98r+4UDLdrxOxUChC9cS6z4xfW5EduCOWhQdYXPPzpwEQVWqMtzrXzd
         3VgMyX04tXstDh7Klb8FXZQEVHx7YxYqyyFZNn4vo9I1NTFNKSVd/bvasmeWR3eVIAo+
         Oa2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4auA+2x3cf8+3nJ4VYcJV412BvIhkGkrQSyGjgHL6Gl240lxYpNjAB5ZsofeNvoZu6x0Elblv2BE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ6SfVhQsPiXiTpHlu2ANLn+tcoO0IyWNmS2oN8WyVG8g7+v7i
	hIXpdOndSd4vAvN/bwb15nQAmTdiK65CxYQxHtvMnNolAQYeX83lAnfd
X-Gm-Gg: AR+sD10+l/E+ZF4xeje3II7eUidVgJsGHjoaiHdRKJRiagBhJUrIncEamFqkjRbv4gN
	+FGpBUIkSq0IKqfXMYDQleVRffR1ATPre5U4YadaQM+0vsoTm1Gejht4HqMM2QQtfXukYu49PCZ
	gkwBbKcn+gWIyfUG6XtilOf5R9nvUeZsjlz7Zz/qfz4KmWcACV9ZX1BXV0jRu1GC1Qo+mfD0IGq
	ielT0P4KmBSMBxemwDpY0PFofQ25mbG3UPKIQt93DcYPvDPzNlgFbLR/cHtwzzF3+rEzt3/k47I
	v37h6fFgrGSHVx2nnUZ/tdWthIBj+/rDHIkblMHMRe8XaKTxhDO/isa+9FiXL6z+Bh2q9VKk35X
	gLB5k17cvrX/iQ7gYKdVgFeAyYBpcI9ws80fqibPk+PROokcStPnG13o/t8k2DH+r+wV8NZRSnh
	JSEVrTV+XYac+IBmje3A1zwvWtuGwXiRkU+KX9QJ7kG8ebQsIcoaV30h27XuZukr9C0y6/T+zJF
	cppLHVFgXOCE5VQsT5pC0UwtXQcNlqySG8H7fcb6GqIAOfL1l1RIbubx0kgGZM=
X-Received: by 2002:a05:6808:1589:b0:497:e695:3423 with SMTP id 5614622812f47-4ad5b5bcfb1mr2048496b6e.0.1785303457731;
        Tue, 28 Jul 2026 22:37:37 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6efc6ffcsm986864b6e.15.2026.07.28.22.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:37:36 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@gmail.com>
Subject: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
Date: Wed, 29 Jul 2026 00:34:08 -0500
Message-ID: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When bringing up a WPA3-SAE SoftAP with external (user space) SAE, the
driver never told the firmware which SAE Password Element (PWE) method to
accept. The firmware was observed to corrupt its heap over time due to
this omission, leading to firmware trap (data abort in heap allocator).

Parse the beacon IEs on start_ap() and set the extsae_pwe iovar
accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-only
membership selector is present, 0 otherwise. This matches the behaviour
of the upstream/vendor driver and only applies to SAE-capable APs when
external SAE is supported.

Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index d32b35ce0..335647916 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -60,6 +60,10 @@
 #define RSN_AKM_SHA256_1X		5	/* SHA256, 802.1X */
 #define RSN_AKM_SHA256_PSK		6	/* SHA256, Pre-shared Key */
 #define RSN_AKM_SAE			8	/* SAE */
+#define BSS_MEMBERSHIP_SELECTOR_SAE_H2E_ONLY 123
+#define BSS_MEMBERSHIP_SELECTOR_SET	0x80
+#define SAE_H2E_ONLY_ENABLE		(BSS_MEMBERSHIP_SELECTOR_SAE_H2E_ONLY | \
+					 BSS_MEMBERSHIP_SELECTOR_SET)
 #define RSN_CAP_LEN			2	/* Length of RSN capabilities */
 #define RSN_CAP_PTK_REPLAY_CNTR_MASK	(BIT(2) | BIT(3))
 #define RSN_CAP_MFPR_MASK		BIT(6)
@@ -5091,6 +5095,73 @@ brcmf_config_ap_mgmt_ie(struct brcmf_cfg80211_vif *vif,
 	return err;
 }
 
+static s32
+brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
+			      struct cfg80211_ap_settings *settings)
+{
+	s32 err = 0;
+	const struct brcmf_tlv *rsnx_ie;
+	const struct brcmf_tlv *ext_rate_ie;
+	const struct brcmf_tlv *supp_rate_ie;
+	u8 ie_len, i;
+	u32 wpa_auth = 0;
+	/* SAE PWE method(s) to accept: 0 = Hunting-and-Pecking only,
+	 * 1 = H2E only, 2 = both.
+	 */
+	u32 sae_pwe = 0;
+
+	if (!brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
+		return 0;
+
+	err = brcmf_fil_bsscfg_int_get(ifp, "wpa_auth", &wpa_auth);
+	if (err || (wpa_auth & WPA3_AUTH_SAE_PSK) == 0) {
+		brcmf_dbg(INFO, "wpa_auth is not SAE:0x%x\n", wpa_auth);
+		return 0;
+	}
+
+	rsnx_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
+				   settings->beacon.tail_len, WLAN_EID_RSNX);
+	if (rsnx_ie && rsnx_ie->len &&
+	    (rsnx_ie->data[0] & WLAN_RSNX_CAPA_SAE_H2E))
+		sae_pwe = 2;
+
+	if (sae_pwe == 2) {
+		supp_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.head,
+						settings->beacon.head_len,
+						WLAN_EID_SUPP_RATES);
+		ext_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
+					       settings->beacon.tail_len,
+					       WLAN_EID_EXT_SUPP_RATES);
+		if (ext_rate_ie) {
+			ie_len = ext_rate_ie->len;
+			for (i = 0; i < ie_len; i++) {
+				if (ext_rate_ie->data[i] == SAE_H2E_ONLY_ENABLE) {
+					sae_pwe = 1;
+					break;
+				}
+			}
+		}
+		if (sae_pwe == 2 && supp_rate_ie) {
+			ie_len = supp_rate_ie->len;
+			for (i = 0; i < ie_len; i++) {
+				if (supp_rate_ie->data[i] == SAE_H2E_ONLY_ENABLE) {
+					sae_pwe = 1;
+					break;
+				}
+			}
+		}
+	}
+
+	err = brcmf_fil_iovar_int_set(ifp, "extsae_pwe", sae_pwe);
+	if (err) {
+		brcmf_err("extsae_pwe iovar not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	brcmf_dbg(INFO, "extsae_pwe=%u\n", sae_pwe);
+	return 0;
+}
+
 static s32
 brcmf_parse_configure_security(struct brcmf_if *ifp,
 			       struct cfg80211_ap_settings *settings,
@@ -5124,6 +5195,10 @@ brcmf_parse_configure_security(struct brcmf_if *ifp,
 			err = brcmf_configure_wpaie(ifp, tmp_ie, true);
 			if (err < 0)
 				return err;
+
+			err = brcmf_parse_configure_sae_pwe(ifp, settings);
+			if (err < 0)
+				return err;
 		}
 	} else {
 		brcmf_dbg(TRACE, "No WPA(2) IEs found\n");
-- 
2.55.0

