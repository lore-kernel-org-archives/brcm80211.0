Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0EF41D4D4
	for <brcm80211@lists.linux.dev>; Fri, 11 Sep 2026 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109888; cv=none; b=Fq9jNo+Peh88trJy+VBujVlItnr3umotig8GaZh85L59XvbEy0TFjP5Y6zxBx7nV/9A7LS1BdaVkuKlIbOGT+A48PYWnFz0Fo5KA0x9sCRFQaGw6VObvHai3ISxvCLsWDfvECGFr5mzGpZrEOR50BAfH16bNbrYW73X7JzC2HEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109888; c=relaxed/simple;
	bh=zu9Pm1Sqpd0lje78r3gAWJfNtHxmaIhDDSHm3uGYqCQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uE/BfLBa3T2Bb2wMzIX9xlH0YmjwXXOAPnzWLEMJ2Ks9iiw5QLPnguwgERttKVFAsB1m771j8E/rkBpk4+qdaKTSns3oiQpUexEqJWGL6enBghSiv0H4OgN5gjYO2nNwlGniznoNDsEnFDa+Nk7xAB+Y/FocJvOSPm7SngzKC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=hp5GoC6/; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="hp5GoC6/"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1789109886; x=1820645886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zu9Pm1Sqpd0lje78r3gAWJfNtHxmaIhDDSHm3uGYqCQ=;
  b=hp5GoC6/QPhhVldVNvzJyMpKH56yGNL3oTmY/kERQQtjY0OpNXS7MvLy
   uX6uIVmNAYfiSWjYxPdsqoMCL7uTCQZJ0hki18MwUjXEvFhFXr9Yr8ETG
   AA5YkNmAiAKAF8DaS02TSvKhTcATO4xxgbmD/eXoGhtd9YOLp+JwP2QRq
   c=;
X-CSE-ConnectionGUID: wI9HMISTRSevYyyJGaIARw==
X-CSE-MsgGUID: GoIBa0ksQJKZiuX45s4fBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="178082404"
X-IronPort-AV: E=Sophos;i="6.27,96,1787004000"; 
   d="scan'208";a="178082404"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 08:58:02 +0200
Received: from MUCSE809.infineon.com (172.23.29.35) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 11 Sep
 2026 08:58:01 +0200
Received: from ISCN5CG5251XQT.infineon.com (10.161.6.196) by
 MUCSE809.infineon.com (172.23.29.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 08:57:59 +0200
From: Jason Huang <Jason.Huang2@infineon.com>
To: <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Arend van Spriel
	<arend.vanspriel@broadcom.com>, <brcm80211@lists.linux.dev>,
	<wlan-kernel-dev-list@infineon.com>
Subject: [PATCH v6 5/5] wifi: brcmfmac: advertise firmware fast roam offload support
Date: Fri, 11 Sep 2026 14:56:56 +0800
Message-ID: <20260911065656.1269623-6-Jason.Huang2@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911065656.1269623-1-Jason.Huang2@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260911065656.1269623-1-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE815.infineon.com (172.23.29.41) To
 MUCSE809.infineon.com (172.23.29.35)

From: Carella Chen <carella.chen@infineon.com>

Advertise NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD only when firmware
reports FBT or OKC support. That lets userspace provide PMK material for
firmware fast roaming without enabling the path on devices that cannot
complete the offloaded roam.

Assisted-by: GitHub-Copilot-CLI:gpt-5.5
Signed-off-by: Carella Chen <carella.chen@infineon.com>
Signed-off-by: Jason Huang <jason.huang2@infineon.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index c11b3eac9d47..519de96b042e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -7830,6 +7830,10 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
 	}
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
 		wiphy->features |= NL80211_FEATURE_SAE;
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_FBT) ||
+	    brcmf_feat_is_enabled(ifp, BRCMF_FEAT_OKC))
+		wiphy_ext_feature_set(wiphy,
+				      NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD);
 	wiphy->mgmt_stypes = brcmf_txrx_stypes;
 	wiphy->max_remain_on_channel_duration = 5000;
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PNO)) {
-- 
2.25.1

