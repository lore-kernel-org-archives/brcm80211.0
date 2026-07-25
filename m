Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF080309F00
	for <brcm80211@lists.linux.dev>; Sat, 25 Jul 2026 01:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784943545; cv=none; b=pfdbMEny0qbicIv6298l79QcFzubzk8dLPkBAueMW+m5heRP+RpoGEuZUXYkunRcc5yUSGNyCJ+uY4wmyxuRigBlWx2Mav7/SyeqxhD4CYgh6G7AuqsNWaNkMBKexZlbYVKhjAaYXcb6JZx4wQxd5AHVUIKR1aVg7zf37xbVbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784943545; c=relaxed/simple;
	bh=nhJB1o3/CftC74m/SJ7OOWafTqa/vTIxBKtN0cwNfC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZE24uwJDJ3La2lzzD0T+/zUpWTVuDa8rwlkJIiXkLA9AFHBmuHA/5ULcs2jbSrvWye7EchkyC73FYvOpBt3XS5wDrSSQmOjTUvFiY+KCiIBj8rnOyuDDrek59CdVeWDfLxSG9A0Cc5TEHxQTUCZfgJsKAIF1OnPp597aVr5parQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCG+wSzj; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCG+wSzj"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4960a66d36dso125097b6e.1
        for <brcm80211@lists.linux.dev>; Fri, 24 Jul 2026 18:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784943541; x=1785548341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcYSfZGUx9sUchaQp0uiGsngi9HwNJwG+1+PdhVxlSU=;
        b=oCG+wSzjS8SNVuePTXW8vE93ttRviNiw5KMh3GN0ff9hhpDEX6mGCNk0mzYcsoR3f9
         gN4dSYuqpaySlt6FN/m+mhD0zmLFynGSu3Ic+n0BOj7rMTWj/IPeMvPUQNDintxAhvTJ
         iJTWlVR3YqI210ejI8d0e0W63ejbAWEm4cqC6fPpA9Fs5sWOCFPLoZWZEOXotEOQOwsi
         wVUeDPpxOapwxbwH6BdbuSOuc7vPLE/y20h4fdbUge9OX7rR0MCFTBdPhQyDNzrH1upq
         EtxzS++RMP2guxNf4H5hSW/f+fQ/1Q1bRPYPy/9Jdwh57APxf40V5vMh45UGrL1zWwUW
         Ql9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784943541; x=1785548341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcYSfZGUx9sUchaQp0uiGsngi9HwNJwG+1+PdhVxlSU=;
        b=cPI3VdEzjg6jMHgapPCbR1mv2z7w9svjBQB/K5zNJyejK7pAE6pPEv6qYCPktT8s6+
         1GueDaM+CAYgUUH6V4rMM+XZxbhdpIEMv2GP+II+vR80xPsx3nI1i+szMqMH3uoWUXGT
         4ZHP/lK0wApxEa12cnlLek98hSSg4FCodbrraL5Q/Xi+UTRgUA7/dJaeap/Kenna1znl
         x7SDrGZ6Layz9he+0T486uks2FHeS4uMtrNk3HGoIAB6hf+LJHXKG1IRXSHl8A3dsXOJ
         sGGlvSKjmEzn7oNjEXiq3zAIXbDHMOcqD2q+Uw/51GXnbekpFBtkCG+LABNDc5/qMMr0
         B/mw==
X-Forwarded-Encrypted: i=1; AHgh+RpSyZ9CDVRAYsY6T4lYWPF4iFsDYfwEYh0wzxU/rnZ2SyJtRYXV7ejdkO3GvvReYwDA6ih5n7zx2RY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3vyMrS4I8w9hEBWiv2yaxUzppEO7gdb5EsfIIti5xiv/7YD2J
	SuwBWV8+DAdkcFecVN9V0onCFdPkgpSzehrHII5RBOULLaRoL5A4Il4C
X-Gm-Gg: AR+sD10YyqOpR6ZEJ2/MVUosGlfFQJaShCvIywb/flia4vhzAWUKxiAPNGJYSSDo2FE
	ypwdTBDcIs8a4imsE2bByC+9Nk8gPj+F4wR1DdW37HKxSsXWDJ0tF3M9zCLXqu8cBDgvNqB6a9H
	uypEPXdfMYiNI13sgl36DHOH5tMq9PhYDxk//h5D1tgGx3tLMEKizvWD1N/OfHB4zAwTTNVS7su
	DPPycMfhQuzoLlrCXK1pcByMFZfubpFgcr7obizFMw99yGD73hFzrnpxSciffeYl+6OBKvg6Mvk
	Tl1jJCT8L461gk/DPqdxapy8zH7UG/y/C44/V07v9gjCQkSQnjAGMNqFlukIOgePc1YBf14Opfk
	SdyVdkoGOTuitRFtxHiUnLOiZB+hII0yi5SQbBBSnqbBOfAl8e/tQSvAV/8awe0CeJClBM+YmX9
	rgOvE8S9z+iSbDZXuTFaF39iThJ7E5M1qOCayi+LCOpHJahhbk8ViChiJsjVgaxByRGHFzecPrN
	5ZG
X-Received: by 2002:a05:6808:2388:b0:497:da5f:d5c3 with SMTP id 5614622812f47-4ab6a1e912bmr607781b6e.6.1784943541506;
        Fri, 24 Jul 2026 18:39:01 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab2cd31929sm5643564b6e.4.2026.07.24.18.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 18:39:00 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@gmail.com>
Subject: [PATCH v2] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Fri, 24 Jul 2026 20:35:28 -0500
Message-ID: <20260725013528.169218-1-bogdan.nicolae@gmail.com>
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

Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
---
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
+			memcpy(auth_status.pmkid, params->pmkid, WLAN_PMKID_LEN);
 		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
 	} else {
 		bphy_err(drvr, "External authentication failed: status=%d\n",
-- 
2.55.0
