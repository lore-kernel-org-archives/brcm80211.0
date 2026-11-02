Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622204;
	b=LRIg7Fh9nEhzC/8ilkR8Scyp0PmFWQzyNTHJwiA+hDEg2Vp5hqsSR5XJga0b5GoM5HJa
	 0s/0MkLZrkaJobBh+KqOE8flzVvIpv7h79KJmUhrx6BtTXSF8c4TTn6fvgmvd5PHcjGvF
	 CO2e8Xk7LFqPnR8EIe3S0QEYVLTJlRd5fnj/FbBMNPAsZ/GnOFUZNd3xK+jkbmxovDf12
	 EW7lzAimApGOHOOrkvFIaA+QG7l0T89Kz6RKNlAYVJXk4uNk2NUqKltkMGg6tD445vSt+
	 6+0hVSdlPu6GEFyLjFDFjGGbSwhGPKUMDLaULhRvkFMRvpoIQNG3NAKqr3L5YJDYxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
	b=e8qBcBzMm7sWqfuaixysTPl2lHsmzPMXXaUsEpAb52vjYPjLZWA+9TBNViMxu5XAwfwx
	 7SwopaMr1c480vniomCvsyZm2hGPFil64ZyJJfhnlihIjpfaB+H8ozaU73xB0uESASI8N
	 s/QrWSkn+tkyLuFd6FZVEPzANfvj2wZs6iq/VHF9Hd80LEwovImaF2i7DsSCzPyfLyvDi
	 2ucleNjaEDrhvLC7KSJYG/ZnLI7ddmtwgt9qKAF62j7U5i8XaN+7lbke0iJL1a5F02SxA
	 Ue2jRpujET+LtLUtIrkvidZKex8HLOdqaMJ5XySdKV2JZhtAlDaxNjIho0K82ogcr5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="djKEVUl/";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348D606D257
	for <brcm80211@lists.linux.dev>; Mon,  2 Nov 2026 12:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5348D606D257
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djKEVUl/
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso1326578f8f.0
        for <brcm80211@lists.linux.dev>; Mon, 02 Nov 2026 04:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622203; x=1794227003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
        b=djKEVUl/BfA7XV1rhC/3sB5pXDxAg+QQtA6iozyzlSQgRj2ieoIBz9OOyFtHcv0GSV
         7pYWmZvAKthfbQJNaa1u8fQ8P+rM7T66AZytW9R7g5a/5Azl5sIz+v+fAaRBSfvFKJm1
         QM9nC4C8puGUtIfgwx8NWJbDiEywOk5ldNNIGz0b28QEjEKm2XkHA51CXhQOx+Frrl9E
         3eyN/4oEySR+5EVQxro1Vif+pPmzZSEFU5wMWozgONOr/nvJeR4gachBaYbvVMHZ352p
         7MF76tydjMonriy8n0ka6DjE/nOZH44o+6Vik7EiOUU7R5XkvNliPuGkgiKPtsp1XDie
         hrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622203; x=1794227003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
        b=xBLC4ocAvWB9DlHUxtCELg+2Qf2XgR8QXPnghDMqFfMfn0YeU3RKwk+h7tdj8m0wvB
         eK3lC7eEtmQhngHhQDSKJxbYoOhWZ2wlKOAEHIk/kGCfBed0QKUJlLo0WvWGaeRj7SaO
         K9fFr4hjH1ghSDvWvvOmkk2eKZQTWhgNBLs3EC1sHE809zHsP0LIn7X6AEkaDacLPnO/
         35PA06f2wLv8vFHphQIw9BYt980t3CKPcqzt5fOGUQlhAqaWeZIRWvBSn2Hdpi6UmWNV
         GXjhYWkIy/GfGLYzLt0+zfykPVSsKhoC6N/dvhSC+WNRIChukrdbyHfPuiFuiUFEaugr
         Gd3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzndXsGIKhDRbxwSDRbiChKcinIqoD60RM3/amboO8FkW97xhxnWDkSEaLl4rsuX1uMHqQ0LgLzgpE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIMK3lavi4xq3rWm93Gm5xkaZcjZqQhIOsiaUKFNkFNTak7w89R
	KqLUyz4b/Umm+/MN1s1Zfyq4s52Yh/K6bPkATk9LxG3yTHxZq7okQ9E=
X-Gm-Gg: AYBFou06j0BpqQ3RzwqymzICxTpzSxkyiZTAGEcgM4xlWvZkbCLgcToOCPYlWnQ46jI
	8aYmX5yWUCtjptOvOpVITq0wCJfY6BKqTNjV4Uw0AEVw1rK/H1TXnEuREXWPjhns5i1V4oRQl9d
	b/V1ZQqDURgsrYpvqK70t+qJBxLvbChVaho0EpOG91FqO5a/LlTbCwJISryY36us5YJm/GsGX7B
	sQon0ap3YNS2kT7PnXWsApHVUu0UmnqsaI5Ta7b2QuLqOBc2A9BEpQetOcOtSc6QhV4M3B3Ti+E
	Qba2ubuChx2IU1Yhp2rP5c4pQXMUoeig/BPE8HmNGIsn21SwWOdGS1/rosPIG/Xae4Qh/eNTX2r
	OeOppj0tv+SypCSLZyIGIzHNBw+W8yX0MG0FtjJJXMbt8cuFpRHxtPqBsa+G2yQ7sXmC2lhdU/F
	lXRFy01/jL8Wx4jxPNm9P/jHfbBTkOwhd48394FjNebkVICKdtjlKURq8H67hFPlalvS1dXW9+w
	jCBor486A/FjmUuaw+9oasjMPOUZXtICtsENEQQdd6vP1ml2ehV0pxDmCHaqIFvAOxmPOJ5i0rw
	GIjH+l240rXNxvJ8OEk=
X-Received: by 2002:a05:600c:4e90:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ac175669e4mr221304045e9.12.1793622202606;
        Mon, 02 Nov 2026 04:23:22 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:20 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: rsi: zero-pad SDIO TX to block boundary
Date: Mon,  2 Nov 2026 12:23:11 +0000
Message-ID: <20261102122311.181075-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102122311.181075-1-tristmd@gmail.com>
References: <20261102122311.181075-1-tristmd@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

rsi_sdio_host_intf_write_pkt() rounds the packet length up to the SDIO
block size and passes the larger length to
rsi_sdio_write_register_multiple().  When the packet is not
block-aligned, the SDIO controller reads past the original data into
adjacent heap memory, leaking stale kernel data to the wireless device.

Zero-fill the padding before the SDIO write.

Fixes: dad0d04fa7ba ("rsi: Add RS9113 wireless driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/rsi/rsi_91x_sdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index bfa386b820d89..8bfb08306d03c 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -772,6 +772,9 @@ static int rsi_sdio_host_intf_write_pkt(struct rsi_hw *adapter,
 	address = (num_blocks * block_size | (queueno << 12));
 	length  = num_blocks * block_size;
 
+	if (length > len)
+		memset((u8 *)pkt + len, 0, length - len);
+
 	status = rsi_sdio_write_register_multiple(adapter,
 						  address,
 						  (u8 *)pkt,
-- 
2.47.3

