Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E12F39B5
	for <brcm80211@lists.linux.dev>; Fri,  7 Aug 2026 03:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073142; cv=none; b=F59+38Z2CHPaIn0gwII3Er2MCDEsSzvBq5Q2tlJ1Ybc5bREvhuvtfOcsqK9xNQ/aVNCitcyENORHZPdpIRhsKOjICnJsn8+h3OvEO68SZCgKIXHpaZRAwBG0Z9GngnfKUBbyZ0QwXAaKmqYf3qhtfIKNhRPmqZuT77DgxoVutJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073142; c=relaxed/simple;
	bh=5DWHTyV/pH+3MdDwtmbB7rkHS/t6yPLT6Xj+jVdd9cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpJhGW9jf6FunCaLZoWfijMYUZl5seIOGohprXG1UYIjeLwDZWHIq4GB/G53GCIu/17LbjmkKvs8L9Dd9iWwgWStC2j5qa9ykSSTw/WuFZngLHWCSTt1sS+AzMRaMsAZWJsffknLdxdnHuW0kFiA7htdRSiZg3FU5Z6c9VCjm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNdajYYQ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNdajYYQ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7edd6e6a327so368495a34.0
        for <brcm80211@lists.linux.dev>; Thu, 06 Aug 2026 20:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786073140; x=1786677940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+6XE7Yc3wed4LEk38MwpLFA21L8FO91QUtlY5oe2OY=;
        b=qNdajYYQB8jCUPZEWZB7SFSV6btfltfJirJY3jS4RFk+nyKIug7pz32RQu9bE3EpPF
         B8ueJeeuPqsjHXynuLRL6f0fnNkw0POhv537lR1OzhEbRO/O6UpQ5/PZa67ZtA2r7lv9
         027alHoEVDKZAe91AOAB1qBTs+dAx1MHURUkuE+rMtbq8yTr/JITIa9I0wtp/uN+VD3M
         u+kgchESf5WymK+EMyl/Ifox33VQVm1ZVNhekBT0gbgsGCsDeABVwCSayL0NPziz73SN
         Hkn5EcBJH8FBhJrKuKfzCtIZ/Q9+6zz/61nM/uVW/Ju+4QN+ceCpukm0fLSe+6oGlQgX
         7O+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786073140; x=1786677940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+6XE7Yc3wed4LEk38MwpLFA21L8FO91QUtlY5oe2OY=;
        b=Wpjk/ATB+1/W+zPPmAKMeVDxjAAJMhvf7ThuUSyzvJ7GWaAlxjQcQehycxhRCXoezZ
         8RSaIaY+0Wk25+Kx1Pw4wNRV/HrVTQeauw7N54B8L7aim3cJyyYxKu4AGl+HpLxUBhrZ
         eFda0g0rHKEuBqn3k2hNlhkGOXA/n2o7nibxH0hR9qDw9vq4vljFcdDm6fKZpGaa9hqw
         +H4t7cVxhtJj12bOqrwTbd2C/H+8t88HZd2vyLSFjkObsKo+/cltaT7o3DdV7OgMYyWp
         qw5y4EvNEvBJNXQYgUsdkEM3i4GCl5ODF/4C6nSrPYbZ5R+EQiTUxICgkMLN93TClq36
         swug==
X-Forwarded-Encrypted: i=1; AHgh+RqRq0QlcOB+lBvEM/ZTwr23xHxw20ZhOsGr2CLH1hnLH8f8Fsapd3+UDLvmrIrzPgrDS0WhZl06CaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR77WqUphIHWwZGFs6ydyd1iskX3FwTXODSQenHsbaQ4d6mHT5
	uZYU/nHZNZUP6dHh6aQDe71F4GtohsdF2OezVydotKHJU3qW9d7teaWe
X-Gm-Gg: AR+sD1333lUGjTUd3wTWGl2iU2GS88vKO+hgrFnVszzY+jesoAVLqqp0wXOnqUWUsll
	kVoLtETtcAQOpIR+mU3KY68d+JPyZQ3EvGsvSFMYM0ESqTZGSLCOQfQusfMJwR4+mpA0zno7A43
	y9tyBkFfSHo5GzvzzSqx93Z3Eow+bT37k94XN4pfq+6xbzywF0Q9HfwdQxsnIdF77GEjvyv4Kt4
	9ws+cEvHxKmXXSuJ50rVvfCVgyHqqtJS1XW+RnViSC2k4kY5UpteaMChGqE60V2lddH/FroStOk
	z3P5JbnZhBMmIAeWRVIoewuI+7ZDwrKl8wG/FLf7oXgye+2wC1UWaVadpLfYk7XlTKLdRH4Zc1b
	vNaXV8fUGeEBmy8POUOSDjSxZvO5zIftQSNR6x5Mvvi28nbwS8Ot8HIg2rEQAGEM0btAbYY3zy3
	VFAqilj6VGigA3+Of+/khyidYXg9rlD72P/fKCbfGRWACaK55y3xjpusBjQBxaz9InYozwH5PzM
	abxyxyTnYKTqoWDk0tvu11bf3VOL+3QbrcN4dvW7bTwjSqZixtRAzLpLY6fw365XRCjeMDmSg==
X-Received: by 2002:a05:6830:8d1:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7f1e5c6e96amr7295657a34.1.1786073139763;
        Thu, 06 Aug 2026 20:25:39 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b563b04sm405786a34.6.2026.08.06.20.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:25:39 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Thu,  6 Aug 2026 22:22:09 -0500
Message-ID: <20260807032209.447044-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when ssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
v5: Fixed line length > 80 chars
v4: Fixed indentation
v3: Added Fixes, Cc: stable, and Acked-by tags
v2: Split into a separate patch

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 873754be5..2c59b5e57 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -200,7 +200,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 {
 	struct brcmf_if *ifp;
 	struct brcmf_pub *drvr;
-	struct brcmf_auth_req_status_le auth_status;
+	struct brcmf_auth_req_status_le auth_status = {};
 	int ret = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +208,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 	ifp = netdev_priv(dev);
 	drvr = ifp->drvr;
 	if (params->status == WLAN_STATUS_SUCCESS) {
+		if (params->pmkid)
+			memcpy(auth_status.pmkid, params->pmkid,
+			       WLAN_PMKID_LEN);
 		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
 	} else {
 		bphy_err(drvr, "External authentication failed: status=%d\n",
--
2.55.0
