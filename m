Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346721A94F
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278460; cv=none; b=etZ/CsUbRsKguZy0NOl5i+urGPjIXs0ey3ogi/yRpy8NtCjE/9r0FC+ijWQZ6ZG0h1gTQ/prGDSJfoncEN7r/Y8yc/IjZ5rRJ6s9cUx64YFrMCoLELf7KXO/Rf1uJHGcym0t2F0rrbdYnkjdpXsldiqsPHfPKOfLlqJHh8c8wWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278460; c=relaxed/simple;
	bh=LKQP83Z0dDVRvLCdrMNAz3pPTpKO+Di7Zsh2SQ1o/Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g8McMBOorLJgZZpsTtJsjQA0f0dLMkLEx9Hb0pAZB6CcSmzbKkxNAN0dplnxgIx1ODYDnSwHqP5khMx9kfkHm2B6xHoKMkaiT+zKA4jImCZ8Fkw6qIjC5R6sMKZZj3ciBc8GfJgjs7Np92fy3uyV+WAdRt490zTU1dcfOJHmzeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VstVCiUy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VstVCiUy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22349bb8605so17157435ad.0
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278458; x=1741883258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=VstVCiUyr2dQToZ4JGiTgs9FjyVVWvjjxZ2+gHltBXTAwjrMsTZXveWKih6WSie6cA
         OdYzFmSt7TVfy4mEKnkhL1wCvZt8SuElKHq/RwkR+mssXGUJGQVZDSzPeCzz8LkPJu1a
         qWT4qNBXRkhTQPiPrxX6/M5yH7qHo0XAhEF9NR4xaW9rcFP+LKmDQNq3koj3FbNg55Bd
         80N5vn12+6wy9FTaCR7S5z0xmrGtZTBPYxPFCtWiLn4edFVg+jg+4DYQJNfOUqxp2dd4
         lXzCNbUqgFxVPrXZHblvyUIbpqRwrqSzIiczIrLP2Iqbwg4of+qQGqpKdWrup/9+PJj7
         z9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278458; x=1741883258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=fPU4SyLNTEPr/+I7yMwbRfmOIEyhF5/zCxhD2o2wO3fZTm0tDfzVWKss7G6H1l0n+q
         PpmuJHTdw2oMel9rLak7k/jaXAMuH8JKrJhtriCV0/guSBFj/OjRw1KGE6+KwO/nFFKn
         SnjvKxgz60Je362/MshxELahMLvNGU/crDOiHD7Dhc+emc2OqJexN9Sp+px3pV08RXBu
         tsrtuRV6r2dHujxCwCBFJ6L1Od98KFqGGKMiDrh8oEc4AmsKuQrz2CSEevmPZ/ig++21
         eXA2EMuVGbeKTRUa4PEmPMX4Nq1GPmuElT15qzFNXXprylcupqLeDS92vU4sq3CINpUA
         bdwg==
X-Forwarded-Encrypted: i=1; AJvYcCVHeRw1SWAuP7OoGg2P/LM7Hm8PMJLvhRI/7zEiMvnHRcLQB2is4xEPRj/28+x1gyTwoZSXzVYzYss=@lists.linux.dev
X-Gm-Message-State: AOJu0YzljJdt9DELzuN9o/r6HFxdJU3BbPajVE9OM0BASlGmaUU8yEvD
	f7WsJUozBZ75Zm2VOLVd7S23E1Q6+r5CClUzFOs6p994gt0X05Vp
X-Gm-Gg: ASbGncsBWMB0IcX7CBrcCC+qoO7+wE91lobD4XLNG7etWagnUzZXfgOYuNXSS/VyRtl
	/UZE4DJ1gaHN5uFCCh+62iifQuboRc60WD+vqtawwQMx1KqYaTqYAbeghC6aImviyQdELsLdoj1
	sXlA2J9iAakVUHlwE6tX/6qK9khEgrcM4GwgzgzIIwY+Z/210HgiLExkgexnsqdZoQJuWCgGDGa
	eA9DG+7Tjmug6xzrHnj542dltououS2itBZwEror6HbXAMjiT5QYNFohfYsKr4504TNq3f8sEY4
	h3kO3rd9RwtSOZeO25NXnLlMQO7Ljkq5LkmDluP+DUwfEMx0uCF9oMasnA/wyB2kgOOMjL51WWc
	=
X-Google-Smtp-Source: AGHT+IHic3IzGXhBZWP6zBd/pJJw64LoRGQ/N6k6+q6inZlCxRIB1pB5KkHjt//av4DrSwa4YWD19w==
X-Received: by 2002:a17:90b:1e04:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2ff49841eeamr12538794a91.24.1741278458615;
        Thu, 06 Mar 2025 08:27:38 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:38 -0800 (PST)
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
	akpm@linux-foundation.org
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 10/16] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:35 +0800
Message-Id: <20250306162541.2633025-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
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
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1

