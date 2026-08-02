Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD7139098E
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659963; cv=none; b=MSXP7yF3PtozQf5qjkUed3P0jrr75pKhVe6Xm+x5nuEuaXMQuzKsKlHQdK0RQUBZdS5F11bOeBlKfPlQh4ppwMOLFhzJq0JaXsQ2z1sRBC+ADkKJP4hrqnLsMxMCB2Y78H7DdvRir25INl3pNpLlGO81Y/LxZbq5xjaokZR/N4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659963; c=relaxed/simple;
	bh=a8ofd41JnpFBwTjDBoMfI57jlMXgC5Ho/1LsoAdjqgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o56KSTpQZM/e1tuIkdkUt/AuTm6CshnmV7+FUmu2paNzNqHzRgSdYK5XxkUk1FnlK4x+sasl+kMJpD8uFJZUctw4K4z9jng61LWOfJa0y9u8Xp1GN43IfwhgQDG4GA9F77TBAWDbsTImUH3i5igZJC3jfhLtpYeiQU04rbf9HH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HF6LCllh; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HF6LCllh"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1212159e0c.3
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659958; x=1786264758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lR3bhmlqcQbP7TXCmWl9MzUNxiTSwB/0YI3MWW/Lfsk=;
        b=gVnNYqIM9nALNkEzq3S9z1HezLYfql1m03ZrBI0aUVd1u3DH+XxMQVLa6YNMtvQWYI
         N/Kh6FgJaw4FCk+FmOKomuD6eU5vVYgC6/xJXfTW3gbPwZNkbAzisLJ9hVdqjtHrLYRj
         TBRByUwlMS/C4gR3XRFbP+lxu/DcdwH+9GIcwGPo/bueuXhAjzOG7bjk9bOanXvyfqM9
         fE8HYXLf1NuVbzkJO9aGS8OY8HLIXnzjMisZHkzMOKNjax8UEznICseAeVYEYc2jFVA6
         ohIGuEwgD8y+Zk3M3boOKyBDzD5MR0/CXk7XmVSQphR/m3b0MXqislv1yIVXC0lFawGB
         k3Pg==
X-Forwarded-Encrypted: i=1; AHgh+RpZ+rPUuVwRzMeJWwKFRugxcv+fxJb09NX2So9xZlCvnoY8eCxfoeVYc2hb1j3SSrIhxInxslLT69M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFwRelsq59cAyyVqLxhPHVBGrzI6d1qIqo1CQNndzA3mfeipi9
	RdbVUG9xBlPTVfBjG37BC+2uXKWpQ4iMrTqZSWQtND4bus0R8XKXD8T4ZOfxhU8P9CESVqWNZ50
	okkZVs+6diVKqmHo1MxsFtpJ4vd771pp4PPbxzJ2bCJoML6AaqiiL8P7SHt4mAq855zgOcKhyeH
	x4lhS1jjc6v4mqaZzd9pdksaZZu6SYXet0CY3cuUY2Ht7PtXus3ZLMMx1zdH/IHdbxFSNjXesWb
	70Kf+vRcgc+BNLc/RmQww==
X-Gm-Gg: AR+sD118vCpNmY8cbzchXy+eDKkoOHUjCyIwH0zIQGTlHXJNUS+WYtyKGVUiCmoQkZu
	6rVvhpw0T+eLKm516Bvemq5bVCCKfJQp7PPzzyB2EsKLELTibnGgfhLJtRJnngB/8uZxqEpp8Ku
	MOfUJ1lT7gQOF5HKrHyqZWb5iVu+6eILc7AzXyriOn/4USabMTJ0vxX20eH4Eae0oHRmuT0Dmfz
	CVoHKibhBH9yiPr06mJ+Eb0eGo8JgCdig08sN/epTCBZIkv2anux8FJ1ZojN9ox02UuyXUJVZTb
	V79IoM/JXhT+pkBW8c7EYa+QrYkHCZ9Sqo2rq1liKaqKEXGvEENqrcqNxALaHeho8aBx+k5oViU
	d8l5BRvRc1/UXymTxhMSo5L55da75r+H9S9H321mrInWAL16uuDRu36lT4q9Wbb29e+XjiWu2yw
	xfqW6sc8ypVnDoa+n9PG2Atfx++dVDOBQILfxszQQ=
X-Received: by 2002:a05:6122:45a3:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5c38787d005mr1737249e0c.13.1785659958401;
        Sun, 02 Aug 2026 01:39:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c37ec3f5e5sm771801e0c.4.2026.08.02.01.39.17
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so27225086d6.3
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659957; x=1786264757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lR3bhmlqcQbP7TXCmWl9MzUNxiTSwB/0YI3MWW/Lfsk=;
        b=HF6LCllh+wBCQh0hFsNAvMKTE+lQ2Hcnt0cbt7m8onFE0G0829dyCtBDVeJFCm7xBC
         Nfxey07ii+9YtVmxqOBIUQCDkmuwbqkcCtyicKk+AYVzjq6dvy9H3cz5nX6K2OcOHSTb
         mIHT5KMPM9fsnlUlLa01Qmld3E/exwMfupD5E=
X-Forwarded-Encrypted: i=1; AHgh+RqM7oHB+ndVaYCS5V7j6xTauWRXyTyUKZpHCcKogcTDdsVbIw6/H9mF8jCMZZoXc6ISFuu14kujtuw=@lists.linux.dev
X-Received: by 2002:a05:6214:3286:b0:8ee:b05c:596d with SMTP id 6a1803df08f44-9084967def8mr138780406d6.22.1785659956935;
        Sun, 02 Aug 2026 01:39:16 -0700 (PDT)
X-Received: by 2002:a05:6214:3286:b0:8ee:b05c:596d with SMTP id 6a1803df08f44-9084967def8mr138780166d6.22.1785659956516;
        Sun, 02 Aug 2026 01:39:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Can Peng <pengcan@kylinos.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: Set DMA direction for msgbuf packet IDs
Date: Sun,  2 Aug 2026 10:39:01 +0200
Message-ID: <20260802083905.3819981-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724092530.674624-1-pengcan@kylinos.cn>
References: <20260724092530.674624-1-pengcan@kylinos.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 24 Jul 2026 17:25:30 +0800, Can Peng <pengcan@kylinos.cn> wrote:
> brcmf_msgbuf_init_pktids() takes the DMA direction from its callers,
> but never stores it in the packet ID state.  Since the state is zeroed,
> pktids->direction remains DMA_BIDIRECTIONAL for both the TX and RX
> packet ID pools.
>
> All msgbuf packet ID map and unmap paths use pktids->direction.  As a
> result, TX buffers requested with DMA_TO_DEVICE and RX buffers requested
> with DMA_FROM_DEVICE are mapped and unmapped as DMA_BIDIRECTIONAL
> instead.
>
> Store the caller-provided direction when initializing the packet ID
> state.
>
> Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
