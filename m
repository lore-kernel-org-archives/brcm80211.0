Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE323C1D48
	for <brcm80211@lists.linux.dev>; Mon, 10 Aug 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362080; cv=none; b=PDDgW+kPLT99Z23wfc85sVSGC/ZmtjzqFwVuz1//1FMoehYhqDQmFTVgdnDP9glaBCTxJYwmhjMuq7h9fMM5AhRmpUhFco6ZELb2cTeYdxFDQNAvoTXAB849LQ9UEhHIrlN/O5+xVs2cuAurDtP4kxdwjHyNF5rC5LpDLYKnuxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362080; c=relaxed/simple;
	bh=wFe+eB14rTK2QJzxsEj/wPvdcJLQRyYKCfBCFcawdP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=McAJhxsm4c9A7Q8tg6JvAflGrwz7iGrU+cp/QaEbTp2sALg5mM8Hc9brDtrLPydLfFsShSylKTzh07D7NZFkRmXpxoUhiNf7gpj5/7fAjZ6qYFkgGQcJuUW6Zh3dXsNsQS9ZkVM5oSdTqnbICcNi+OtpC7q+3jry/0ShdKTcLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=TNz9AFeY; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="TNz9AFeY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1786362079; x=1817898079;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wFe+eB14rTK2QJzxsEj/wPvdcJLQRyYKCfBCFcawdP0=;
  b=TNz9AFeY3aG1pb/dYjrXqIzSIjmmXcmUd2+qnvi62h0kbaM9TlQ2sKuE
   B15RMl4ggzQmpk1+ML3vyH6VI2AJz5M3SeS2mviCzYrVadOiOEsUfSRi7
   JvnCeasezGjE+/sf7WLDPNXZS/Vl4hOJCa+HXcDl61NPCBqIQXeOQSda/
   0=;
X-CSE-ConnectionGUID: o4XGxnmsRIGVx+hLV8dztg==
X-CSE-MsgGUID: FaVBJvzCQ/qpQQjqXI1DQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104127858"
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; 
   d="scan'208";a="104127858"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:41:14 +0200
Received: from MUCSE809.infineon.com (172.23.29.35) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:41:13 +0200
Received: from ISCN5CG5251XQT.infineon.com (10.161.6.196) by
 MUCSE809.infineon.com (172.23.29.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 13:41:10 +0200
From: Jason Huang <Jason.Huang2@infineon.com>
Date: Mon, 10 Aug 2026 19:40:54 +0800
Subject: [PATCH v3 2/5] wifi: brcmfmac: detect firmware FBT and OKC support
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260810-upstream-wireless-next-main-jason-11r-support-v1-v3-2-bce4f460ae0b@infineon.com>
References: <20260810-upstream-wireless-next-main-jason-11r-support-v1-v3-0-bce4f460ae0b@infineon.com>
In-Reply-To: <20260810-upstream-wireless-next-main-jason-11r-support-v1-v3-0-bce4f460ae0b@infineon.com>
To: <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Arend van Spriel
	<arend.vanspriel@broadcom.com>, <linux-kernel@vger.kernel.org>,
	<brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
	<wlan-kernel-dev-list@infineon.com>, <jeff.johnson@oss.qualcomm.com>,
	"Carella Chen" <carella.chen@infineon.com>, Jason Huang
	<jason.huang2@infineon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362064; l=1717;
 i=jason.huang2@infineon.com; s=20260810; h=from:subject:message-id;
 bh=w0tKDr1ycE8vtFVe3phEtveDPLGcakEwmu8MVGPoFgU=;
 b=RLj5cVma8pYquC6LRkHefTIlprzqm02oSajyTniwCb5EC17aGftB19Q80gv1jfuSqA0UpOL3R
 F3YAN4YC+dkAptUFeF5hAp30QW3riT4ZFPlGnc86igd5isjOZKW3Udl
X-Developer-Key: i=jason.huang2@infineon.com; a=ed25519;
 pk=BmqGCssp9w9TsTSVHuzcc6+C1o5uJ0uZK4ZSmrma28M=
X-ClientProxiedBy: MUCSE815.infineon.com (172.23.29.41) To
 MUCSE809.infineon.com (172.23.29.35)

From: Carella Chen <carella.chen@infineon.com>

Some firmware advertises Fast BSS Transition and Opportunistic Key
Caching support through the firmware capability string. Track those
capabilities so later roaming offload handling can be enabled only
when firmware reports support.

Assisted-by: GitHub Copilot CLI:gpt-5.5
Signed-off-by: Carella Chen <carella.chen@infineon.com>
Signed-off-by: Jason Huang <jason.huang2@infineon.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c | 2 ++
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index 488364ef8ff2..cc19e5e7ebf5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -45,6 +45,8 @@ static const struct brcmf_feat_fwcap brcmf_fwcap_map[] = {
 	{ BRCMF_FEAT_SAE, "sae " },
 	{ BRCMF_FEAT_FWAUTH, "idauth" },
 	{ BRCMF_FEAT_SAE_EXT, "sae_ext" },
+	{ BRCMF_FEAT_FBT, "fbt " },
+	{ BRCMF_FEAT_OKC, "okc" },
 };
 
 #ifdef DEBUG
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
index 31f8695ca417..8165a286b630 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h
@@ -59,7 +59,9 @@
 	BRCMF_FEAT_DEF(SCAN_V2) \
 	BRCMF_FEAT_DEF(PMKID_V2) \
 	BRCMF_FEAT_DEF(PMKID_V3) \
-	BRCMF_FEAT_DEF(SAE_EXT)
+	BRCMF_FEAT_DEF(SAE_EXT) \
+	BRCMF_FEAT_DEF(FBT) \
+	BRCMF_FEAT_DEF(OKC)
 
 /*
  * Quirks:

-- 
2.25.1

