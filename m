Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB9188589
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317745; cv=none; b=bgE8Zl5O4Q5qFQ8zLPXuP6MOvx78WSz5IzWvZxGWCxGCOYLWgl091bcB7vskF+3mPsCPL0mEKiPg/Ugmas3nvmEG3i4VNPJW4CrnUr0OmvqqzB2b1GKlAhNbu8R9Ztv10DbFR8qaP/lETqa9uLXGb7bPzO1kTe8GpZxaUfeohdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317745; c=relaxed/simple;
	bh=QrUQcvnmZvtnPzZt8iGP4n9fjXwFPYGCz1cGar7E9G4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K2Zk8WFYhEXWIq3hTthjF5+WaHf2d56Nk0XxrGoxHugLV+QvailVtvNz2GEtm5H/YPoST/yyoULDzo7pj49OIW8JrokZmwotgRJf1apOXH/rFPSnjowz3JsFnVR5v1z+PQky/5sLo726n2m48Ccu7z2ctBPkOouDt2ESfWaamGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blJEf4NC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blJEf4NC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso4735356a12.0
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317742; x=1725922542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVYXpp6XlxrexNwfXvthb0cGeIQ6ry7hBWcPM5Sw6j4=;
        b=blJEf4NCpHCRXqI1Pgx1KjSpYsJpwOUn66fs2sEHTdY005MT+T41xzzF1j75mkm7lz
         bGg48aHfj7WZSDFDe4TkciL/ERCjAHC8T54Ng6Ri2TLv5POcZIwOQpNeOJ/73bHjTR5P
         8JW3YZBAc2xWHCbJ06Dtf49tw435rEXGIzwQpmuPO5Xakf3m2o99p9UHNxodKvCoJY7N
         1hIB+ufWoqKZ6X3kFQcqTHbYZJslgWuQI/Pvk/qdt2tggp9EntllRcL/BlnDoqCuYkM9
         TgHoCyYnWMZcvAoyVi2Vi1i1a0nV6dShfm+cZvAwNGKf6c0xU48lA9tmVP+2cZ7QoVhC
         Bt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317742; x=1725922542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVYXpp6XlxrexNwfXvthb0cGeIQ6ry7hBWcPM5Sw6j4=;
        b=ggINQp49m1Vr2p5Geupx/CkqLKKfGaLrIwcAnoVKH0mGqnzCGjnVk8Z4qdNcSwi0pn
         cVYFtlVJA58ulLf+4piG0J1ltTb1yeQDqppxhBsy3hk7lEGdi+V+eoVfs2gzorLS8EB6
         IgyTnGvOKs5nKykxxNpDbRyd/t6/Nkm+5OrO6I2nYoYrjjmmmTCWwLS+PoqizO5b1e/U
         0ZnnCvd9XUyVHf6uSnQIK+J2jorZPBDXXZuqgmRG4qkxjraDhxcom+CM6KFpPHIE4HoO
         fdooiUSZuDQnJOZgTA5Ma6QvVrNTD+U4fS8s46mcHo92+S8wPHr0J5J0ubIUBiDPD1iy
         pmNg==
X-Forwarded-Encrypted: i=1; AJvYcCVzovHr23Hel97gf5doEWToLThkZz40vc+YEWRaPcK2E9Ud27TC6Us+VIG1/6rQ4UBjFOEcTEE6SnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvsNXTDxSX6H+KzGa3uib2xtpEw5qsBfD9D9w+ULBCD/JjlB9Q
	969x8U14dd97sjm9ZpiD8zOJ+X1wm3/hTnY73KndRktZMgPq6hQI
X-Google-Smtp-Source: AGHT+IHbdygsiHgue6jnl1jaLVDHduB6XMrVTsWjFGMYu9OGTpHCFsbA7oouOyBeUFys2QcOOAL9YA==
X-Received: by 2002:a05:6402:2711:b0:5c2:6c75:4359 with SMTP id 4fb4d7f45d1cf-5c26c754480mr578287a12.9.1725317741625;
        Mon, 02 Sep 2024 15:55:41 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:41 -0700 (PDT)
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
Subject: [PATCH v1 2/7] net: dsa: realtek: rtl8365mb: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:29 +0200
Message-Id: <20240902225534.130383-3-vassilisamir@gmail.com>
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
 drivers/net/dsa/realtek/rtl8365mb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.c b/drivers/net/dsa/realtek/rtl8365mb.c
index b9674f68b756..ad7044b295ec 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.c
+++ b/drivers/net/dsa/realtek/rtl8365mb.c
@@ -1740,7 +1740,7 @@ static int rtl8365mb_irq_setup(struct realtek_priv *priv)
 	}
 
 	/* Configure chip interrupt signal polarity */
-	irq_trig = irqd_get_trigger_type(irq_get_irq_data(irq));
+	irq_trig = irq_get_trigger_type(irq);
 	switch (irq_trig) {
 	case IRQF_TRIGGER_RISING:
 	case IRQF_TRIGGER_HIGH:
-- 
2.25.1

