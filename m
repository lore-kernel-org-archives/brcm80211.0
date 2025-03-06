Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEA8221F14
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278388; cv=none; b=EaiDAZC+zlSHNRD0A6jrio7/WQrKl51SpeXnnAH8BMhOGSFRR2LpeNefLmYM1A00p6rNIxHCiRDgAkSsOlQHGDiuMj4TD7rt/QLGg9X0of9Zn2FF8IUA/ctHkbbw3r6WTtfHY5/lOz4iVlHvwTej3DpqWkuf/cs9J3K7AK8bvYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278388; c=relaxed/simple;
	bh=rTA+nqUh4NnBYzrIs97e5P2aMLuYYBuIh+2ppv71b2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d8F3HMg1fPCKd9JYHWE0lR27oN+IIt/iK+/DW3yOjcIp3xZ4OD4pSbZtcL3pWngas1LqVZ4fFENv21zfoUM/KhhU+Zy8j9CIsRkStCaw6mhjyyD+kOJH4+JcpfYPYjvfi162RGB6CfaAH1s0SjYuJTpBQIVciNiVw8b9WEWvBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP149pml; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP149pml"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso431355a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278387; x=1741883187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=SP149pmlbihPppnKjuvR79CH+s3yMMaxQmRJ9j5Z1yZu2Vd9LFjm2uMiNGxcny1jXv
         6x7xjhdoMtOAMuEeaTNyqphvUq169UYsztqxLwX0W6Iv84XhoY7qcQs6RkbI0bLodPTb
         hOjAPh0zj/nth6NIWWvAV+Nrczcf1u5nJ6jxf/komnLZNpdozzEjD9UDdKvXOpZcDGA/
         L60zEakoSJf6+INaAIa6bnwGmV6PDAp2m0+ymsdu7DmP3sxjsaI0gR2M/uq1StgbjVPT
         NPHqAx0olnUxCoZo9ccqg/D08Isl94rec0FLFGAG7xeK64XUlivQZyxh5fgp6ndt29mq
         3B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278387; x=1741883187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nutb7MJ9eZ82YUrFszN8Vow0UKyoKuoqD2og5G/xi8M=;
        b=RDRCFOX9gccmlsIk/hQFMcAzW697fIqC/C52/g7vwmWZfKbpvfh9KxRIgvbioCAuJZ
         axiw03IsS4hFEmtWeR2menSanizmCS+lJvKL5IKFOEhzPUmmRAjv9LHm4CwOBsOwxxhO
         4x1Q0VkDa+qhDXMvyUIMJ3p53E4+0g2ySnqBqm1kW8jCxrZYEAR4P5V0+PYprR8sOAvA
         ywZt4WBilWfEchjAtNlLYBj+mFW48kAjaPRvwTDtZe9JYvAhDC2+V0JBWNzB1JAxZpzt
         Nt4EyxzdXJggwGNCwzSEUUnm8T188uSzBcJE7B8A+AArOBwxb1yjMWKz7Va4OFdlQXTN
         di4A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Fjd6KvlYh1ELS2ZPaLHFf7XyAFSK6Fb04vKks9806ZkTtfvC8U7YTKLu/dG0HTfErvyTnFxzb+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjxP33X7Bcqc2OpqlA+fWR1Be73JSoXclG54S0A/3hkWXKeuFa
	JrxpwzSh1jimcxR9BiHyNyyvM9z4L57TD/HvVQ9jT9LyiYBFuXD8
X-Gm-Gg: ASbGnctAXB2BV5pEF0BcVqo9f2jlNk5hfgNENrkxM5ZETnz4FjztFEAiVenvPkq40ZY
	RxvMOn9q0CzhhP1Jag7WqiRYdoBnwkfI9jYDS3afUhMTCicniISsMTQp93vMZgrBYcUkY3JcJSO
	h8Lj7tUSRBUCHD7UZBQ68tMXwNWOh3y0j/FdXKnmuI1V/mkNKlRUh5LheVyvyL1q+t4q0TWX1rl
	zxPD4/Zg3ar+MJmgufqQF30nAOj7kBimxKlFsHSKArTjU+xzfsJMEEx3zMZnGQ1+y/USa+xQPVD
	Gkx5bKXX9pwDYxGhlM92JMlSKqriMixsFoPa5I+8l5sUJzd//ipwb2iffxyxbMFKGgYMbUM5XOA
	=
X-Google-Smtp-Source: AGHT+IGnAbA7Y19sbet7/e0FnFCoTVhlFvSe7Bxbq8+Kkwl3FpD5fIN6ErN6a+dRmXJdCrcvBmbfjw==
X-Received: by 2002:a17:90b:4c07:b0:2ff:6ac2:c5a6 with SMTP id 98e67ed59e1d1-2ff6ac2c770mr3503350a91.31.1741278386628;
        Thu, 06 Mar 2025 08:26:26 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:26 -0800 (PST)
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
Subject: [PATCH v3 03/16] media: media/test_drivers: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:28 +0800
Message-Id: <20250306162541.2633025-4-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
index 70a4024d461e..e0f4151bda18 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
@@ -5,6 +5,7 @@
  * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
 
 static u8 calc_parity(u8 val)
 {
-	unsigned i;
-	unsigned tot = 0;
-
-	for (i = 0; i < 7; i++)
-		tot += (val & (1 << i)) ? 1 : 0;
-	return val | ((tot & 1) ? 0 : 0x80);
+	return val | (parity8(val) ? 0 : 0x80);
 }
 
 static void vivid_vbi_gen_set_time_of_day(u8 *packet)
-- 
2.34.1

