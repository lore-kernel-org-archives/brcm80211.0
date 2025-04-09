Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B00267B65
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213584; cv=none; b=ukOf7YvJRilNVPUfAfwfu5XUOoPGsKpvtc0IEDz+eHlzIwUD2TBY9pMunlHzupLu4bMRn7nETvn/bzvfrr6U8ikrqt8XMnaiTnIDOqMkitSoSayJCzifJHkibHAoQ0ct7GhA0nQhdRcFsarTYPC9hW/KSdCgWIjxDVyLFQzkkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213584; c=relaxed/simple;
	bh=rxppiQbYDlsjNOLABuc/VVmyhqbUYZOfS3L0zA2RDZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=APTUgvcrugto+hFcI0xV/MbtHl1ioMonJQ0GJUNQ2cGeTr8dfJQUlozmC058XKk656UYkOLhwZIsEhG1v3cNSERB1j8qCpb9ev/3Zy8f/yCNdqdyjXgwE+OMiAG/b1EQ6DbZy6xkn3l2uf3Pv+MP9+fjeZNObKEGq+TpSAYHaXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBoOLavG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBoOLavG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso6389888a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213582; x=1744818382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
        b=GBoOLavGJ86DUyhaDskuO5SdY897OkyZuk4mxum+c7LGs5ZhobTZnYeKj/BErZ1I8b
         VjC76xtzzHuvPMz1azAuCGkylueIaDmig8R/0H3x/jGv7mIzIJi4hiGwn51dZ0BNH82w
         Qix4sTWvRsMuVDZmmQLfIDmwUJswp1oeFV33tkIAdg9NtLtiXO1LuNfKKqqMMZPFP+G8
         i/qXZRAcfSOiYD6aX0tqAAMzZNp7Gw1eubloTA2GqrYtnzhVTpYp6IP7xJKfYpY6Jl8q
         UFFVaq9FW/qKLv+09Zfs62cWGg+UWYpaGhuNAa1aBpClF8B8TBfvgfK6ZGrF9aNY1hCe
         Rfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213582; x=1744818382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
        b=UlaV6dLRw68FRg6zkq2e/CiLC8j99iLdA4nf4LoRKsbw7naA0OWQ6LsZhv2nQ7CuPG
         Tjt7lr0kQO24h+TbNvkcjy8IYyHbtuL2c5E1tiFNQXj0t7vFDj+l5ixDMw+8pC1MXJHU
         Y9q1rQWJ15Im26RcC1lZiM+Gi+3eI4WwbFQ0UDMX9qLY/hghYRZkP6r946Rw39Is9Hlw
         otmbO7NNFuM1bHaNnemVMWiAdftGmCxrz8XalmJOpttJL4x09oPUfbZGRuymZMnGgnoG
         H/p8cx6AbXWk7HCLZCXS6ZudUvL+83o18F1OKAsdR01MN1McW3igcWoQ/lb//JUqU2gp
         Ukwg==
X-Forwarded-Encrypted: i=1; AJvYcCWd/p+5lgUHzE6bZHobFWZGCsenPjTzaYwEV5ynKe2/mO0hlMKEWf+yDx1pI4CZkUuQ0Mr8oZbHyLo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxep34bwTR5a0clvmClvVa/lSZgH1f6FTVmZcWDKWlxmRt5DggM
	XG3m06oX0KgDFW8tHUzGEdf0WeacHWPj0MluYcuh/waZntzEVaPw
X-Gm-Gg: ASbGncs8wos0A92wo0OR3lmQoHCGAQqxJZhjSTOxCec/dRHunWv+IBpL7tmunDiatyq
	ROaGvLN1dHdyr5e4Hz98FXIdCAXNPNiiGTvPFKsw9E0bqxzGHOBSaKoVXCnPRaABXmIKj+Qz/gh
	xjZd4J5DQmS/maW0rUrtybqB1lfjZcGV4LIMNcihCECk0dHYGX4OO9L1YafAB6ztDEBtgl316Jn
	zQhe7k7VFpwffiqgmYcj5iHU0l8d0LCMKSr1tU/iifeldixPy2iNFgXwu/Q9IKodjSm73rx/eS3
	8p25ONHYvVRMd02NJXOwUzX3lzxasO+x8jgApzAryoELDpbF9nI6wqNMOHnLI6TDGT+pfrQ=
X-Google-Smtp-Source: AGHT+IEd3EC/Z0ac7A9mI3otjelgXE3L0dUH+HAICIEWTo12gF8GwwD4nirjVp0rJrYl27/5nkbmDA==
X-Received: by 2002:a17:90a:d60e:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-306dbc2a7dbmr4740684a91.30.1744213582002;
        Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:21 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 09/13] wifi: brcm80211: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:52 +0800
Message-Id: <20250409154356.423512-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..5d7500ee2d3b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,24 +284,9 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
-	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
+	return parity_odd(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
 }
 
 /* descriptor bumping functions */
-- 
2.34.1

