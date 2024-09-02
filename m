Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BA18BBA1
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317752; cv=none; b=axsnJ8e6qe7i4GFaVfyDMRDJ6UiUP2A+nIkpx2YiiYYZRe5KP/cSOht3mhUHr4wIa3qlGm2Cq7RNf8qHKXwuuw1CFWR2Ek2ihFJrQDMYjPzMJF+/Jb5wj6jlvz5VfKLFTHPcfU3unqrjEkXYx4a+z1k2RuAf8Y6ERXVNfPenUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317752; c=relaxed/simple;
	bh=XPXzxmxPuh0oRaEz8t/+d+iASKVe9XfXqjCyTenSPXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OWTxhClp0bD6oo5/nK1SuPZ9ZALWlV0sPo1VL562eJOVNpZqmIrMAmER1kOAk+TTQ6WIVg7ZMX6zbNcuLEXgKghTHl8cvh1xv2NsW3qeI+chRQEqaA7SyNSmnRUIcURM4MBx7zuHUwyZbs9RW1TzTGIr/WKBxRUUcWKkWgc0xe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAA9fp/J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAA9fp/J"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c26852aff1so981002a12.3
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317749; x=1725922549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBEQBp9g3k9SiXOvyYlcXlhKd3Urb0xWdAtZQorxYxM=;
        b=RAA9fp/JloVW9AsmY4Mgq0L8kSeGbEW2SQc7ya/EoX5Pc2c8CBHhX+xRIkp4VU0aNp
         O0Z80xUSLt6hQTIVAqWAbh/fHWTDmjdJxJ0oORZb5SnD8JWgG73zTJB/1iM6JIM2J8lT
         NUYLq1lwV8qd7VqMa+ySYY6CgQS7EAoRG6m4MQkGij+kYsLYa8nkA0qscFvSRxrrBB8/
         tHnKaEmzTpBKL9AISTkhEuFwUHmIe85W//jIM2JK1mPEuQ2pfwXCdNdQABRak5winr3X
         h4Op/RKgizbMNz4nSmvnrfgkGkFfKNVTwJaQiDPZinU3cLYBZ11Lh7+cXZgcN6aaptTC
         SDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317749; x=1725922549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBEQBp9g3k9SiXOvyYlcXlhKd3Urb0xWdAtZQorxYxM=;
        b=Gv4LQH09ES5L2HpbOE92jwQK3bMgcKxZDLqjKPV5plGJaWHRCcblvOY9ZYsksHZKCL
         VzgXmPC9qlxCKX7LeWbF9cWMaJrTuf9homYzXUIN4DV9UM9Jru/EQzTMKv1/RuBfeNi/
         C7uehs4cn9X1lODdQJs8idT2ETx+riQzWYxVFINirnsOrIjUDbmwt/xeGrChx47pr7B7
         mCjkQIdc2NE6KCvPS2cF27ZnhAPlgK7q5KeLOCfbRJuR3i9RLxlJQOCkJe4nSBDaLZUy
         2qxDlyZdioCAlkl4dmqG+RahaBJGhPKmVV2vZsMxNCIytk6qp8SbfH5LtaoZ29A8xj4v
         iypw==
X-Forwarded-Encrypted: i=1; AJvYcCVQD2n+bW4X577c1s0qPwO42cgqkACs0h6jOxdydtFoMeZZqw6DgT9BUJ3swwJd1GpRHtNgJAFbiDE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6W6e+eF6Os2wbdx97Bsb/X/G/u2MWo7uKIl4DJSeB4zJPCpUQ
	z9U6kOyvHVF9wjw3lIfi1K9252JimOPDPsN/J1ujJZR/Uok1oCI2
X-Google-Smtp-Source: AGHT+IFGC5whsYTLJRRo+OjnE/CnzW9ioCA7rs9/xXHxQe/SonC3TILzstrZixS3NMZMqFGr2Uhr7Q==
X-Received: by 2002:a05:6402:27d1:b0:5be:ea9c:5fe7 with SMTP id 4fb4d7f45d1cf-5c21ed40982mr11174299a12.16.1725317747871;
        Mon, 02 Sep 2024 15:55:47 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:47 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org,
	alsi@bang-olufsen.dk,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nico@fluxnic.net,
	arend.vanspriel@broadcom.com,
	kvalo@kernel.org,
	robh@kernel.org,
	saravanak@google.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	devicetree@vger.kernel.org,
	vassilisamir@gmail.com
Subject: [PATCH v1 6/7] wifi: wlcore: sdio: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:33 +0200
Message-Id: <20240902225534.130383-7-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240902225534.130383-1-vassilisamir@gmail.com>
References: <20240902225534.130383-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type(irq).

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/wireless/ti/wlcore/sdio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
index 92fb5b8dcdae..9e1b644beba9 100644
--- a/drivers/net/wireless/ti/wlcore/sdio.c
+++ b/drivers/net/wireless/ti/wlcore/sdio.c
@@ -324,15 +324,13 @@ static int wl1271_probe(struct sdio_func *func,
 	memset(res, 0x00, sizeof(res));
 
 	res[0].start = irq;
-	res[0].flags = IORESOURCE_IRQ |
-		       irqd_get_trigger_type(irq_get_irq_data(irq));
+	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
 	res[0].name = "irq";
 
 
 	if (wakeirq > 0) {
 		res[1].start = wakeirq;
-		res[1].flags = IORESOURCE_IRQ |
-			       irqd_get_trigger_type(irq_get_irq_data(wakeirq));
+		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
 		res[1].name = "wakeirq";
 		num_irqs = 2;
 	} else {
-- 
2.25.1

