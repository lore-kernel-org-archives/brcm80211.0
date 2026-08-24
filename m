Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426EF35DA64
	for <brcm80211@lists.linux.dev>; Mon, 24 Aug 2026 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538482; cv=none; b=TmwWfGNiXXOEesMkyMHCpXRwxXGBPJSkb1cu4D4K4J7HqV0FQ7pTOiIW7rABVFtBvC4ZQnGxLwGFUt8KQOAqkwCz80PtaXdVS4AIZNPFnZZbXvYjCNZJL4Qa9T2q0HUceLDekCDIUdvYQiaC+H2w4aXJQJZ8b9tu8EL02+evcgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538482; c=relaxed/simple;
	bh=2orO2X3kae5MZd+KLTJhLBcyE1WmQ7MbZo7jM8M6XHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVlKpeBDf7TUbO/BeiCLl6Pjox3uiGhf0dVe9XY+asGUAInCaOhHaZZVghhAC35SP1U/0rnvr/uEYQnYzOZKNaYMsNW6Oy4dprRDVXFwMlEnIKrquAa+cV/iZ0910vw5fFTFr3UiJzS2MaQ8HverUMAgM8HLip4rwH/PwlSzdWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=EKxq2hU3; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="EKxq2hU3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787538481; x=1819074481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2orO2X3kae5MZd+KLTJhLBcyE1WmQ7MbZo7jM8M6XHQ=;
  b=EKxq2hU3xPvXJddnY3nrqEoc3oOIz6zSPD7RXd1+u+UfL+CDYtDxxnxR
   fZ2xDM6BUeKLOLbJCq62JM1mJI5Tfx0xcSagYqL+ZSwdROAeCrvg/4tLT
   18FYQDRYiysMDIr/0ZUThkHbN04+XYONnQAz6eqrP1QQXuFrf6Mo5mdMs
   w=;
X-CSE-ConnectionGUID: tzJA+TcfTgyJ3/6JDCa49g==
X-CSE-MsgGUID: GzrBeViJRjWKDmGG+8VFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="174150362"
X-IronPort-AV: E=Sophos;i="6.25,239,1779141600"; 
   d="scan'208";a="174150362"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:27:52 +0200
Received: from MUCSE809.infineon.com (172.23.29.35) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 24 Aug
 2026 04:27:51 +0200
Received: from ISCN5CG5251XQT.infineon.com (10.161.6.196) by
 MUCSE809.infineon.com (172.23.29.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 24 Aug 2026 04:27:47 +0200
From: Jason Huang <Jason.Huang2@infineon.com>
To: <linux-wireless@vger.kernel.org>
CC: <johannes.berg@intel.com>, <johannes@sipsolutions.net>,
	<arend.vanspriel@broadcom.com>, <hsin-hung.li@cypress.com>,
	<linux-kernel@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<brcm80211-dev-list.pdl@broadcom.com>, <wlan-kernel-dev-list@infineon.com>,
	<jeff.johnson@oss.qualcomm.com>, Carella Chen <carella.chen@infineon.com>,
	Jason Huang <jason.huang2@infineon.com>
Subject: [PATCH v5 5/5] wifi: brcmfmac: advertise firmware roam offload support
Date: Mon, 24 Aug 2026 10:27:35 +0800
Message-ID: <20260824022735.468599-1-Jason.Huang2@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MUCSE823.infineon.com (172.23.29.54) To
 MUCSE809.infineon.com (172.23.29.35)

From: Carella Chen <carella.chen@infineon.com>

Advertise NL80211_EXT_FEATURE_ROAM_OFFLOAD only when firmware reports
FBT or OKC support. That lets userspace provide PMK material for
firmware roaming without enabling the path on devices that cannot
complete the offloaded roam.

Assisted-by: GitHub-Copilot-CLI:gpt-5.5
Signed-off-by: Carella Chen <carella.chen@infineon.com>
Signed-off-by: Jason Huang <jason.huang2@infineon.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index c11b3eac9d47..6a97be3149fc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -7830,6 +7830,10 @@ static int brcmf_setup_wiphy(struct wiphy *wiphy, struct brcmf_if *ifp)
 	}
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
 		wiphy->features |= NL80211_FEATURE_SAE;
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_FBT) ||
+	    brcmf_feat_is_enabled(ifp, BRCMF_FEAT_OKC))
+		wiphy_ext_feature_set(wiphy,
+				      NL80211_EXT_FEATURE_ROAM_OFFLOAD);
 	wiphy->mgmt_stypes = brcmf_txrx_stypes;
 	wiphy->max_remain_on_channel_duration = 5000;
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PNO)) {

-- 
2.25.1
