Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329042139A6
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278498; cv=none; b=fC39DMwq79frukUzUAh/C7uNNFQVV/laetexjoE165QTdd6jKPmWoh00O2ppD3MdoZqiTQ9fljEaxjzMJiwizxF0a2uhJelthoSYoi2t0USFCA6kU25lsBtziY/d/G3U7eDM3juG7uSO8uK/HAg/bLT+VDADbEZXugBmRJQAKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278498; c=relaxed/simple;
	bh=Wbj+Koi+nWFPD6iLPf9X8IXOjBAM7BvB2b2RpboElIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHXD0F/ekk+YMyV74myDFid+UDdu2/WiaOdoQW/JVFQA9ubPOamrG8rMuhGNdcyFnoR9airNn1Aa29ev2btsoZlEyqPXKuHQS447C8fVF6AyDCt6ScXOrcc9I0pG4ECyW2tFP2VFCOyC6UtaibSkcwDGbib4RIPO/RIojykeG3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8j0OAM2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8j0OAM2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso1640785a91.1
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278496; x=1741883296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
        b=d8j0OAM2XwGO0Gfl/Bphjvs0H1XY1/T2TsSxTrXCexqB4UILbDIlN8bIbzFi8rOrpX
         Qiw47cYjBKytnDXCYCfkKdVb8g3uH+i916HraX/GAPG2oA+3gPOdEbJ+IZ6QRF1ctfdl
         Pmb+i+8jU+WMerp/q/qF7gJB6YtoGA6dnmhfR8pg12mOXUcJOz47sxOFoXmgAfLqEqOq
         dU+r5QO00c7jIAX2ntuSr16biAWjLwfnXB3eLQEvCuagZDNx4G6j7uugbtHThLrzYqz6
         uPrBkP+4+ipzWRowfrUNwnYLi6og7WUJWiQr3AtW+Ea9LtyDy1QljHuQRyUDwWFFPx0I
         Lzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278496; x=1741883296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS9Ngq0ErapA9ho16k90z8id/zApcMAPWGpuMTc0x9A=;
        b=AIdhJACn/sVsijOIvLt8gx8BNSi0uyIszP2bRs4y5NHdmjn4Sc2ZB4O/rVU7oRtXJ0
         QcRJzJA1WL3s91dxr7vbUEG+VJC6XUE74zSZp6y4rvQUoasS7y0isJYi3XQd7T4J+Bfb
         KC0Ya8FfmZJv96yEn95halJo+yb5sCwF/lb/EeNzUdj0FmLHhIHia1tCIcEyXpABO3h0
         Tu5pwenFdD0ZePCAsGs6SX+jpIiLySEP2lU2TADIyxXTODQxOoUBO3vatnsFEBWLPaYF
         aLrBCOk+8OEIKH3wF6cYzg2x3aKmQiqLdtepwn9l/EebD6cjEc+e+TOQV++XwhpsKPL4
         jZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUKRroRczHNd88cd6qdA6kHH1tfBgdVtCLHFjYrjvBn/o5QsqlWL1rRmpF9Ls1eGysfKJDnXI3OavE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9b1nfWIJCsPi/vW9Ym8xrBL4Bnte30sqYlm2YMsnqdAKEZlSn
	yN8Dodhhjb6LYhTmdqP7wKtSqmsYUjJg8czMcl/AN2Ke8SM7h5vC
X-Gm-Gg: ASbGncuUezypGWFwNP5HWCBthnmIp8N0tGXzOWCkqnrQkYuuwAIAbz/3jPP5GmWNuiC
	XS8XIPYe3hdcLecrbxaMWPeAlHQgxrj9J5Y144WibqFhE/RAstwByXcivl6tMf+kxuBhMSTTG0I
	HcVIP7NNg4VpxXB4qWjNsh2RDXyfWpq2uks4OvQZphYVi1hr4he8ZpHvkUEK0JLxa+d+QZZCg4R
	YhrvgPUFCsnKWZqslmGR3684CSD9K540y/HTlfmk63gFB0p4yTVYeFkvF2qfAkFWc7GVLGm3hwM
	O+ZveFbdolrF8aLTkmN4OrS1PjKOT9ydIrAQL1gfPYPPYdaxOR2VEfNRJWUBLVkdD5IjiUTiItA
	=
X-Google-Smtp-Source: AGHT+IFnMh654YdQkj0YFSRHf+ssdwCg9qa/rMgaUesbiD2om2YrQrVL25CKfgP6tloqN6SwFoBXOA==
X-Received: by 2002:a17:90b:4c4f:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-2ff6162ec0fmr6970693a91.0.1741278496344;
        Thu, 06 Mar 2025 08:28:16 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:15 -0800 (PST)
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
Subject: [PATCH v3 14/16] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Fri,  7 Mar 2025 00:25:39 +0800
Message-Id: <20250306162541.2633025-15-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Change parity ^= parity64(v) to parity != parity64(v).

 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 46511236bbca..3356c478e395 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity != parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

