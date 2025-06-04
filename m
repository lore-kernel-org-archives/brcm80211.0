Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB72236FC
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028655; cv=none; b=kL1pJ9Fer4Bjm0LL2eAPSsUDLiv6PPAa7JiD69GcIIBBPzbf5PfNocoo1PfS7dGWq3tj+DqAvRV7dBesdIZa9QdCxETBG9eT/YY+TABeLIcoiEjrHdD2hU+a3BMpg2y8mp1RpJRTVlM34CLiTZxtRnILhS0x/+S3NyoGlq3ngyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028655; c=relaxed/simple;
	bh=rJNLhXV7wx7obIrobisWX5noloSA1mSgI4AkwK9agsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oz7KQNaio8Q4afcrFcVJQeN8bCR5djOThDzVgkhbPwxwNMpJrrqUJGqQaQlJPqLiQ16Jl4hBfFhOtyDoGO64hNAhF+Iyr6Cl5D1xE3uKpjdjybb+5sw2no+K7AH1pB0/Tg98Chu7HPc8ka5baKavSgdO43SGV6Aebcb45F2eSC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Q2QZOxge; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Q2QZOxge"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1749028653; x=1780564653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rJNLhXV7wx7obIrobisWX5noloSA1mSgI4AkwK9agsg=;
  b=Q2QZOxgeJj1Ezk7FgRnKqQyxQuaI/cm4jXtG+OgruJ/DAJUJu4wDgjEb
   liJexdX3pOTvbMJkq01ANiPSLJjEX9jboHE9p3vLinkRRbqocpeYNyMg7
   t61AQ0+Iso6vwRXPDXCaw9217HJWVRX0jYCFmJeHtegyrl+CEB5hSwnPj
   k=;
X-CSE-ConnectionGUID: wso5d8XsRY6jYeUpEAglPw==
X-CSE-MsgGUID: URZCzFLASPqJHRtAQSRlhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="113054892"
X-IronPort-AV: E=Sophos;i="6.16,208,1744063200"; 
   d="scan'208";a="113054892"
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 11:17:31 +0200
Received: from MUCSE835.infineon.com (172.23.7.107) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 4 Jun
 2025 11:17:30 +0200
Received: from iot-wlan-dev-u03.aus.cypress.com (10.161.6.196) by
 MUCSE835.infineon.com (172.23.7.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 4 Jun 2025 11:17:28 +0200
From: Ian Lin <ian.lin@infineon.com>
To: <johannes@sipsolutions.net>, <arend.vanspriel@broadcom.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<carter.chen@infineon.com>, <double.lo@infineon.com>,
	<vinoth.sampath@infineon.com>, <gokulkumar.sivakumar@infineon.com>,
	<ian.lin@infineon.com>
Subject: [PATCH wireless-next 4/4] wifi: brcmfmac: prevent disable controller in apmode stop
Date: Wed, 4 Jun 2025 04:16:29 -0500
Message-ID: <20250604091629.3943-5-ian.lin@infineon.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20250604091629.3943-1-ian.lin@infineon.com>
References: <20250604091629.3943-1-ian.lin@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE802.infineon.com (172.23.29.28) To
 MUCSE835.infineon.com (172.23.7.107)

From: Ian Lin <ian.lin-ee@infineon.com>

Wpa_supplicant will firstly call scan before start apmode.
In mbss case, controller will be disabled during stop apmode
so next time it reports fail in starting apmpde.
Fix by removing the disable operation.

Signed-off-by: Ian Lin <ian.lin-ee@infineon.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index e23cd6fc0f56..b4078e74f135 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5392,11 +5392,6 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 			profile->use_fwauth = BIT(BRCMF_PROFILE_FWAUTH_NONE);
 		}
 
-		if (ifp->vif->mbss) {
-			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_DOWN, 1);
-			return err;
-		}
-
 		/* First BSS doesn't get a full reset */
 		if (ifp->bsscfgidx == 0)
 			brcmf_fil_iovar_int_set(ifp, "closednet", 0);
-- 
2.25.0

