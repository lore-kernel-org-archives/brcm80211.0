Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B818DF9B
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317755; cv=none; b=Y3UacznALbBkal7U9xtsKa4FbALlMH/3XK5dTk/MGlh2O5pc8Yx5Mih8t0VJT5Inr6iRSK/1EEffXuAeD7FyB/PyZeSB+Qna4JjBh/sybctZNnSAQyz014WMxU/dmAnt/1swBZDqleAkkVlasyU/zW/hg3PE8kXNHS4fmJoOsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317755; c=relaxed/simple;
	bh=aG0ldiriHfw927e+9EU0XgBJ1LEe6dToHI6YishVZBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sTgEmvxd7t7wQsQfAO189AwP/ItQDP1BAp3qIeBkuu8sDim/srnVJpT0FEdCez6YjNxiHttQ3hvw/89tHy2tc89kY5z3a6Gds3IoPGe3wBbLBB8tzEtfLzOPqR5FZc58ZgixtoxZ8C8Rq83Maxsww5M5TBMU0cKFJq308o4weC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9yrdHnY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9yrdHnY"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so4327289a12.3
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317750; x=1725922550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M3zrQ4HRuBwzDNVnr3UQEv7suH9Jl1q9Q4EWJeNzEg=;
        b=b9yrdHnYdcHJQSl6LWsTb1PcCw6EcY3aOlFWebGSZtkFmwF4q9isSntNNmYCjkFOIT
         v0ELhrSveHl0yYpHxTaOly+Dg0mqC/LaqjXRnf6ltdDFZzlJxQenMo90Imao43tfivXY
         fT6uWn08iduWkROn/7m7y3cspV+InILWi8VucpAcqrqqklVVle3ZeWc0Mw1wj+RIwKUG
         rIoc7cU2rU/WRfBqNj0ki558JCXpRjXoPpZENITNc/5dpFFhnordF70fRSq3YGuoVQfD
         fzzAK5oJlfSVVNcg7KtZ85WSwRbt7YQ9k+RkZyZkKegpqky/OOxyxvMvBzNIkXuWimMr
         7TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317750; x=1725922550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M3zrQ4HRuBwzDNVnr3UQEv7suH9Jl1q9Q4EWJeNzEg=;
        b=fMAY08XWaghJ7Oh73p2jDfAfqgq5TR2IeISp44IFGGVEOf8A1au7RwqaIUAD6ovfNZ
         qQhueekx97l7C2idlo67tq1YJMW9JN1qJ4NBXDgyUvSe7LXv5PmCufbyiisvaqBh2Oiz
         0q+nr0U4cKv5V2Exqa6se+Zq6k74vkfDVnZyGPKrRFSHg3ZahkA9kMhRaBVci866zt0y
         BDjtvLGXmgjN/MKrgKikbusl+Njamn1M/ETD6FMXl4q++vfinNf+NTWQMkUDpTvuwcJP
         aR2VbDDNaEM+TVuNheLdwcrv5vCd2r3BDJ20AYbD96CR8r1pyAALc//lYKgO+qYu5qbc
         DYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxZH7oUeGrH1wZzznW/WiXk5Ize0V0dsjUg2T8yHeRQCqmgeYnuILl8Ky2G48t7unWw1oqy3jgqDw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1jrTQVxDcni46prHw0rYaUn34AFMhqbf8f0LuC4mUF/BzG73J
	9pXGJ0jXbO/BP4icXd2PwVM3lOwJJMb6ENDd3PqNgG7FXl492Zbr
X-Google-Smtp-Source: AGHT+IH90LXc7EwUasb8l0337BP8vUcyXOMkNHmERTlLixA2VuUgFhtFY6H5/0/XcuBxznM4NJTdXg==
X-Received: by 2002:a05:6402:5107:b0:5c2:4740:93ec with SMTP id 4fb4d7f45d1cf-5c247409981mr4161897a12.9.1725317749721;
        Mon, 02 Sep 2024 15:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:49 -0700 (PDT)
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
Subject: [PATCH v1 7/7] of/irq: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:34 +0200
Message-Id: <20240902225534.130383-8-vassilisamir@gmail.com>
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
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 36351ad6115e..5d27b20634d3 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -430,7 +430,7 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 					      &name);
 
 		r->start = r->end = irq;
-		r->flags = IORESOURCE_IRQ | irqd_get_trigger_type(irq_get_irq_data(irq));
+		r->flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
 		r->name = name ? name : of_node_full_name(dev);
 	}
 
-- 
2.25.1

