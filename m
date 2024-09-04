Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976581DFE35
	for <brcm80211@lists.linux.dev>; Wed,  4 Sep 2024 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464972; cv=none; b=Iu9ffYjSmUZ/DEW7gZ5+x3hpMEQq2PjZcay6K5OXUBrMtMAkXAIHjNpeu66YEzpc9u0Ho9AtpnSf6UCGkitQyFQYTfiZxBkbRHbpgqUJIppjZPZqIlfscbzied0TbTf/sYKHqHiHSpJ6mp8jSsgeD9za117qYZVb+okz26ZR6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464972; c=relaxed/simple;
	bh=8TF0DZ64f28Pm8Phb6WrG+icgwirkNE86A0gihnv8N8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cDXW/1gO5iZhQz0v2tRdNklJxti6j398Kt7f+KyWPA3cOlf20OajDpsTC/XWO+wb+TrTGN3iV8IzsCG1ryxugoYcQzlakIfxvquaJv5THfz43QRGVvjZbUUXb/3zwE6pYPtifGh80Csn3NMV0GsPoXl4WegWncf8SNz5L0QQLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMfmMUFE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMfmMUFE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86a37208b2so813223866b.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Sep 2024 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725464969; x=1726069769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orsagbjZ9uOmxNFDLl+5N5H1lZ9l2qcANXdjwlXzT7g=;
        b=mMfmMUFEPXjcCGrXEno3IPqJGh0WsRgAbMetygLuMDv2V5yk8QzWWG6W5YtCTQut3o
         N0KGzJ4XDUJA2lDEP0yQmobyYWzMZmn+eSp5n02SQn7NsactWQGqFbw9jpjForCzdZTP
         10HoXfhV4yVqW9k3hwHvASTKvSlH7YR1i0wM1SLPtDfS2zM/ijhdu/5CrVk4Z085T8ye
         0wzcDWFB85jcpg87EV8thisycicYOVqM6TAKkFAJVGkdP1Rzz9wmM6/yL+6D/9AMcPr9
         UW6CmguR+kVmCHFLLzBs4jAF3qY/FmT8J1uO8/G/X+XfQN+lD5JF0UGZ4+XRO84BD9Q2
         K/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464969; x=1726069769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orsagbjZ9uOmxNFDLl+5N5H1lZ9l2qcANXdjwlXzT7g=;
        b=gct8rIWIefNeKTyWe4tJCDUbjt27Zl1XTGmaD1SN1tFFnyABsDzoom11lN+sqyAQXN
         7e+4ceaUHSL2KQOVqjvOmBtA1+wNw6G6Y6WUuz0YlMuboHlKaiyshYZ98eDZRNqUZ4sP
         dIO94g86DgAPvHezhDrdeSmax6GNEwZWV7kgzuxL1hjInPpVlnPB2uu7kYJ6IYdyLCqh
         S1mp9O4viEb7Nd4hburOS/w6rF5tLN1f70TuoxdacQmO+1f84KLr7ZsuOI0uxuWEAAu5
         UjO1/SXafncjk9k/fkQdTONj71bt0icdd/tyUbBei8zqMrd+HCbVnyEJaFbLMLlc8KLm
         E4IA==
X-Forwarded-Encrypted: i=1; AJvYcCUNEu3QlkpZcEMgxPClIs3ItgCFr/XRr9N3ks0Twt1ptIst9GTw8gcIdMhhzgCC+2lR2cLZV5HmgJY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZAkxqX8QO7w0P22OyLpda27/jE7pf4/Jtcn4Hw/DLQat++92c
	iqwC30ytHXWZFfFPN4Xn+2KTZVCB6gLEFAxPhP2KXvgkxe6XPJcc
X-Google-Smtp-Source: AGHT+IEduDzuYeOIdwhKy2JI4JAwMT+sVJ7/2Sg7vQy7HKUWdU3nIBK/2msTZnrIU+IDAkfsh92wDQ==
X-Received: by 2002:a17:907:3f21:b0:a86:a694:aaf7 with SMTP id a640c23a62f3a-a897f77ed65mr1247603166b.10.1725464968841;
        Wed, 04 Sep 2024 08:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:2f85:317:e13:c18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62038c0asm7825566b.62.2024.09.04.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:49:28 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: knaerzche@gmail.com,
	leitao@debian.org,
	linus.walleij@linaro.org,
	javierm@redhat.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: [PATCH wireless-next v2 3/3] wifi: wlcore: sdio: Use helper to define resources
Date: Wed,  4 Sep 2024 17:49:19 +0200
Message-Id: <20240904154919.118513-4-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904154919.118513-1-vassilisamir@gmail.com>
References: <20240904154919.118513-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resources definition can become simpler and more organised by
using the dedicated helpers.

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/wireless/ti/wlcore/sdio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
index 9e1b644beba9..a73207bbe5d7 100644
--- a/drivers/net/wireless/ti/wlcore/sdio.c
+++ b/drivers/net/wireless/ti/wlcore/sdio.c
@@ -323,15 +323,12 @@ static int wl1271_probe(struct sdio_func *func,
 
 	memset(res, 0x00, sizeof(res));
 
-	res[0].start = irq;
-	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
-	res[0].name = "irq";
-
+	res[0] = DEFINE_RES_IRQ_NAMED(irq, "irq");
+	res[0].flags |= irq_get_trigger_type(irq);
 
 	if (wakeirq > 0) {
-		res[1].start = wakeirq;
-		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
-		res[1].name = "wakeirq";
+		res[1] = DEFINE_RES_IRQ_NAMED(wakeirq, "wakeirq");
+		res[1].flags |= irq_get_trigger_type(wakeirq);
 		num_irqs = 2;
 	} else {
 		num_irqs = 1;
-- 
2.25.1

