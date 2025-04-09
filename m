Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE536267B9F
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213628; cv=none; b=lJyUBGbL4US3V4x0QSden6VrJEX7x+46te6M62K3r6gLeoLd7tXvX9mV7+ac4tGTAQKqj5WKYQ/l3/HBJb6C48OR9oh6awWLGJCIESBySX85sVkfuQie5WqVJvCIlwruE+um2fig4db2KqiqgbzZJQERCc/iO9HoW6HMSBUu7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213628; c=relaxed/simple;
	bh=glSAwwj1LCX2HcCq8CCc3CWcWjMh8MB3lFrgIi3HsrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SSkRJlXKMBJrU2C9nnXT1HMInog8JMRoUG/bAgIUBNJIkpPgcLTZJOzbDJNBIQSkS6/muaNvE/RI5wNvt3+/7oFSv0znG0JJj9v+rWBy51zbCDHUnUtIx5qaF86BPG+F/aqMmqyBxJNgGoO6IyAgmq86HeOOcbi/4yQso0Y9onM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3qPQYDI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3qPQYDI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af519c159a8so6359380a12.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213626; x=1744818426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
        b=I3qPQYDIa4/2tN900kdZWLY+3AsTleCSRsL/OEIaofY2QtGtDM+IL74pYUsvEy4wrJ
         l8PfWlboCiivUGGUMLXooWADUn46cKiFbB1R3Fehu7Na0CcT8oXZX1S0DcX+Mk4m1U+P
         uws7MNG41ICkgQNImpw6CDRu5Y51zbA022NYZdGKr0zCk+o0JNDJy4xnNk2axFzgHgor
         Hzb464keVgm18PGFvYKgUQSYeL03KvNdJDO8ZRFQGhq2Swn6KRheWmtUKHzcaRgxHygK
         bnSRxCk01TXwDOyDzb7g6ZoUGw5AEoSRwx3gLzHLHGHWYEfGfCMwxqRNBpDqz7qCzbZF
         QtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213626; x=1744818426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCEd/+juUKZOFlQ/4SCoGPbjU2jFBlmcZeDTBbgWCik=;
        b=IUqxV6cr0IK5Nyxpc4TKOnkwy1BXqEHsHRCeechqrLf2CXZxRNooYcek5U2oZhrN8c
         bZMyJ6dTBeeNEympyFTKktqjwP8Ml7E/9J/U9cNDH22dvEAGqhnXfsoAQo4gyoqzsV8u
         SU96LmJf8JqS1ELHH31SJOakRdG0PegRkglDBbgkocSL4WVvxA72LAJNWSx/OMmRbmvs
         XBJzxSV6X+e0dRTgL9ZpapUvMgL3gOuUojQnjRGHsoyAMy48nWfXWwV261NRWgR3SQaY
         /Ii+2/R06Q1quY1c5WNZx4gi+mz58HRd5OcZsVbJM9megm3UJs8ZGjd89aYjlM73MspI
         B6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+LVe85g0Im24rG7J8LW1HaJY5PkbXMkPUUDrc2+QBzS2QYNfFNLZI4+YRgRRf6F2/FZnQI4CRQ10=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRbqupOO/BaFKbDItjxPTSn9MtiGIDB0HeHYW2lspcvr9kQ4P5
	+aqoWA1LV52jLXHyMcHDl00VrQPiTorRpTJIllcDl6sKlR8TQkBA
X-Gm-Gg: ASbGncti8qsr5Z2Ju5eEHDgrUM0XqzXmW9IK7/JkaZGzpUW6pngsfopLE64HDJG2Fbm
	7GmOJGDuIDobMjMKO5BA2PeU0Wghstbf8A5K0w+/bexuOfXPQCls0p+ahhmg9VgAqh5ZrkLHUyf
	3jD2PqW3WVvNM+4zHqZzs7ScZnMCE4b5OclTx2+p1C4aWl+CuKwfe3+xYHn6kXPUdkc5is065Tr
	rF2UvunTO/3bz/uoMw93bKJ5MlZ24Onv7Z05RvuzrKZga21gcMX0eQpLB2Cn8u1axwWYofFIlvs
	l2jKm+LAQ82IBsdnIoFe1n46Xg1jdyKFPLgDgVeVokeVxBxTGWhbn0bu83iQ3H8lTc8nM6c=
X-Google-Smtp-Source: AGHT+IF8SQ2JgM5sFunT9Xi0DOo/QXgkDUpLAzWqHE4Pm6PBSNMIs+CrkMQPqWas8YcuXm51yI9Ehg==
X-Received: by 2002:a17:90b:58cf:b0:2f9:9ddd:68b9 with SMTP id 98e67ed59e1d1-306dbc0c8abmr4476592a91.26.1744213625892;
        Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:47:05 -0700 (PDT)
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
Subject: [PATCH v4 13/13] nfp: bpf: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:56 +0800
Message-Id: <20250409154356.423512-14-visitorckw@gmail.com>
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
---
 drivers/net/ethernet/netronome/nfp/nfp_asm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_asm.c b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
index 154399c5453f..2f8f78abb6f5 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_asm.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_asm.c
@@ -295,11 +295,6 @@ static const u64 nfp_ustore_ecc_polynomials[NFP_USTORE_ECC_POLY_WORDS] = {
 	0x0daf69a46910ULL,
 };
 
-static bool parity(u64 value)
-{
-	return hweight64(value) & 1;
-}
-
 int nfp_ustore_check_valid_no_ecc(u64 insn)
 {
 	if (insn & ~GENMASK_ULL(NFP_USTORE_OP_BITS, 0))
@@ -314,7 +309,7 @@ u64 nfp_ustore_calc_ecc_insn(u64 insn)
 	int i;
 
 	for (i = 0; i < NFP_USTORE_ECC_POLY_WORDS; i++)
-		ecc |= parity(nfp_ustore_ecc_polynomials[i] & insn) << i;
+		ecc |= parity_odd(nfp_ustore_ecc_polynomials[i] & insn) << i;
 
 	return insn | (u64)ecc << NFP_USTORE_OP_BITS;
 }
-- 
2.34.1

