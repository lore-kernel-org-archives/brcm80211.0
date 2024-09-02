Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0D188928
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317746; cv=none; b=t4HhtnHjSn/kr3vHcooyqbvsZz+plRqWu70B3qsCQb/6VaTfTDR5COqVhyMhf1WyQ9C6+4m1xXWsfvFru9iQZIuPC5M3DVCUunhl2SAorlB7oBgihOI0vTnXFLvX3hk8DtalEo7T4TOotM0oWRUl42P3RJLOj7hJ7Fxz8EsEASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317746; c=relaxed/simple;
	bh=fSzJPU8bmjY5Ro+DB3zswx5GV+Kvbzad2TRXw4i/y84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N1Nqh49lXVlPEAln5owLeRecNJTc2fcEJEaEz57OAfVNMWm08D0r2MDym7pXOiv2LSZqoVJPPHlYne/EFgleGsGbuEmyevjs/66Nj5ciOd5V7I7MGbApEIVEtB28Z5AGqfNUgxVsEb5T8aVa3KY/zvob7jwj84JqEPTPFUi2j4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4CZ2rT/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4CZ2rT/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c23f0a9699so2587718a12.1
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317743; x=1725922543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMRQxsu6IuAS6frrvyS8c4hkmHHGDuOUXHIGD8sRn2E=;
        b=X4CZ2rT/6EJqOTTDvfIOJvTNeeFO63pkLtcP4G8D9hnmvC5GJpNpTKmJ2TMaPtgeHi
         e75N8L7iHI0E3pajblbi7k+A8EqDSjAwk3XRuyaRofCArLn6PeLWYN+v2wQr9zzWkgrq
         6wDwtg20gPXcYwTEqcAaG0mziaaB1yJmWl91XRl1I+4yFMZRY03q0qOzIrNJT7W2mMeC
         l01SvPVY8le5rAIeOUNnoP9QX7CSLktyiJJc6QAqnIRa/B0RlQmdQM5hH+a0kL0Kme6U
         AqS5vDg6Cm+yOoxsy25Dvmq8cq9wcYcOiV6qv8JKOsFvTiSCV3TKKPCBmPsLIE7n+pIL
         w6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317743; x=1725922543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMRQxsu6IuAS6frrvyS8c4hkmHHGDuOUXHIGD8sRn2E=;
        b=Kd6E7p7UkuUm41K5HA7lTaY3sDfe5OJSf/fuK01lPMEhiEUsUEtw7x2MyKaZZX7ZNB
         +ZHYWC7kojlpCC59yY8hogmfUGlkPPT8kJKoEZHlj4EvJ6TheCMpGEWw4UYF35eJj+Up
         9Q3quQ86DEC6H86BfX8Ielw81rZQr1rM7ULw+jkE6obvQjjvsMWiD5rmEZNYpA6oZBnc
         8Nd78DjZIb+LO/0MAaSm7lh6iXFdaPZ1yJhmdQoiEKZkVY4bjHJiyrgE8GF/N6RCssLH
         sL45YGeKsV+2ReMiLf5HTTrWJz3L9e2bIJKgicbfsWV6MHhplBpOw+RyMKobEa1CNLIT
         sc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQeUSj2/Lnixn/pgv5HzIuOG5ItAEaaBxrA+KT0zvm2/y9+7gRNo/o/Gmao0WXVYZZsnSTQCJJNUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhbQpkR2jQNRRNBHsqsos85RP4JZMyghizt0T2iAvTYWijonQl
	ZnRda0R9ogIWWSv79uhlZQrmr8KnBh4qdmbHivvZbVJy6tgp6aA5
X-Google-Smtp-Source: AGHT+IGpOoiKZ1FObkw+EeG22X+GUgUsivRxsCpbNjjmSCMOZtMUSBCFQPPTD6c5DMOsUOlzrB7Ojw==
X-Received: by 2002:a05:6402:40c5:b0:5c2:5cf7:a615 with SMTP id 4fb4d7f45d1cf-5c25cf7a653mr2982329a12.5.1725317742949;
        Mon, 02 Sep 2024 15:55:42 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:42 -0700 (PDT)
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
Subject: [PATCH v1 3/7] net: dsa: realtek: rtl8366rb: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:30 +0200
Message-Id: <20240902225534.130383-4-vassilisamir@gmail.com>
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
 drivers/net/dsa/realtek/rtl8366rb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/realtek/rtl8366rb.c b/drivers/net/dsa/realtek/rtl8366rb.c
index 9e821b42e5f3..e49cfdfb85cb 100644
--- a/drivers/net/dsa/realtek/rtl8366rb.c
+++ b/drivers/net/dsa/realtek/rtl8366rb.c
@@ -599,7 +599,7 @@ static int rtl8366rb_setup_cascaded_irq(struct realtek_priv *priv)
 	}
 
 	/* Fetch IRQ edge information from the descriptor */
-	irq_trig = irqd_get_trigger_type(irq_get_irq_data(irq));
+	irq_trig = irq_get_trigger_type(irq);
 	switch (irq_trig) {
 	case IRQF_TRIGGER_RISING:
 	case IRQF_TRIGGER_HIGH:
-- 
2.25.1

