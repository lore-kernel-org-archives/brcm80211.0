Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D01C7015
	for <brcm80211@lists.linux.dev>; Tue,  3 Jun 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946852; cv=none; b=SPY45iHZNYC8ETwaK45jB0eMHbsn4xDSye0jeCL5m3MxW5wV0LuwHEg2Y3175EJAgbrtCBhlIq9djGwnvs+Mir56SL/4m+Lt5GgHz/r7aiSRiQA3ZPF2LzQLBhnyBbA5euoOU4JmvKiCxxhEuDXz5oWOwbYhJSXjZCXt7OvlHlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946852; c=relaxed/simple;
	bh=Uowr0sIP+wDxmN8p1DSg+tWmGaoaZ/UnJmKUP1z6qyc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z1WdW5pC0khjC8nEIV+9PdoZCao9LSaWTwyOpitfOY56NNWogI+9wzTxvbgFQ0PKGWmy7B8VivJ7L5hB28T5pCRHk77LgzHMGwILpIYUwH6KV9J8q8YFvD8zKI1GDrKMWQvdEDx+Lg5SqDtwZnuhamdo4NTb8h0kupVDo/kJtUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Y6lniUji; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Y6lniUji"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1748946849; x=1780482849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uowr0sIP+wDxmN8p1DSg+tWmGaoaZ/UnJmKUP1z6qyc=;
  b=Y6lniUji7HBizwPR9zbNbe24qnB1KFFLW4649avhFklk4gusYn/aExh0
   ztaaCzg/n4CWucSP3IJPJMct4UYSA05ElSIBs4jz75VhumR2Y5Pnw6vFV
   fNpH2ADCul4FxGtcZ28yoAr1rQSLvdExZv8sJXBcyn/eh0ThR03NVaz25
   c=;
X-CSE-ConnectionGUID: x9VJdPTPTLO7sPlu6pQv8Q==
X-CSE-MsgGUID: 6F5SPthrSTK0zmoYCShTIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="112926854"
X-IronPort-AV: E=Sophos;i="6.16,205,1744063200"; 
   d="scan'208";a="112926854"
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 12:34:07 +0200
Received: from MUCSE827.infineon.com (172.23.29.20) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 3 Jun
 2025 12:34:06 +0200
Received: from ISCN5CG14747PP.infineon.com (10.161.6.196) by
 MUCSE827.infineon.com (172.23.29.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 3 Jun 2025 12:34:04 +0200
From: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
To: Johannes Berg <johannes@sipsolutions.net>, Arend van Spriel
	<arend.vanspriel@broadcom.com>, Ajay Singh <ajay.kathat@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<wlan-kernel-dev-list@infineon.com>, <gokulkumar.sivakumar@infineon.com>
Subject: [PATCH wireless-next v2 4/5] wifi: wilc1000: reject SET_BSS if any changed AP BSS param is not supported
Date: Tue, 3 Jun 2025 16:02:51 +0530
Message-ID: <20250603103252.18039-5-gokulkumar.sivakumar@infineon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603103252.18039-1-gokulkumar.sivakumar@infineon.com>
References: <20250603103252.18039-1-gokulkumar.sivakumar@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE805.infineon.com (172.23.29.31) To
 MUCSE827.infineon.com (172.23.29.20)

Since the driver currently does not support setting any of the AP BSS
parameters, reject the entire SET_BSS operation instead of misleading the
userspace that the operation is fully successful.

Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index e7aa0f991923..98776ef9195b 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -797,6 +797,12 @@ static int get_station(struct wiphy *wiphy, struct net_device *dev,
 static int change_bss(struct wiphy *wiphy, struct net_device *dev,
 		      struct bss_parameters *params)
 {
+	/* Reject the operation if any of the AP BSS params that got changed are not
+	 * supported by the driver for explicit configuration.
+	 */
+	if (params->changed)
+		return -EOPNOTSUPP;
+
 	return 0;
 }
 
-- 
2.47.0

