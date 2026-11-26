Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697568;
	b=uFkRE25fGw4kvt87wslerPs0PbvSysm4F5iEjSEerguIUcOy7YtT6q63SOnAl78II6xY
	 i6nZP6wkvaKXTSsQjbESbEyPozXQO5QsMs4XZdknpdyS4DVILqKNbhvAw5nlsa1ekQMiL
	 2bXvPlvoZh5ixRE/7orAQcFPyxXXZBJmEb2gI8Ixx3jCD3ixmmV9tHHX1B8YBnm+5vXpo
	 DY2tM3BbiXqQnobyVLIBlAsWUYS3eNea/sgc7c15d7Irg/qIkbplYemKwTG10B9cHlNEc
	 18iNeWKv557YfwuNVMXr8C61KBUPAqfAAEkHuJAWxLF84JvzF3PzObHEAwL+dH8ERLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697568;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
	b=hLicsTNcG8YFSATI3XvEWIHtztgtmwZqRcHnp0zDeNkuX3KfzV1wLETIjE3HWiuAtVyP
	 zo485LHrf8YDWCrDUL94VPZ0wPa7VXWR/bDpKmw8dDTvj5UDI44R0qBlU0TQ8aKjmPaYB
	 d4iFqRX8IYkA74f4GYJF/DLkY1H0hG6f3wudNK8FdIWylvXbKjCZ40BSr44ICAYUYMBZL
	 mJBxl6oNEYuGdVCb6YCRYxvOmo74ZBtFIciu/Dy3Ln0sE0c2+FK6w9YGmp+zLDm/wU9Ee
	 mZi09Uo108T1pMMiS7WkYsW/cf9vwIanXAGTLA2MIhYOVnsCJT13K2zFh3YbLDAOKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gKk47dwT;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97698606A323
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 12:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97698606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gKk47dwT
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2f0458cc9easo56116455ad.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 04:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697567; x=1796302367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=k3x01txUOE9r62WgritZlNLIVjilVexJCJ+zS85ae8Z3ONVi5TxiAYIsnGjukRYYTS
         nzqvAOmsYmi5e44r25vZpDueK14fPlbfd9Od//SRZ0esGLN5IXMeUXjOcPKN1iDmgGDS
         Ui83/5EIF/QB5OY/TRqgslptOsoOR/dmkuAhYIJs5sOxYA3SW4/4fU+WMingBqFzWoG2
         GwffuH5aJE6tS3sn0VBjBX+DSbbAKjb755I8JOCKOsADFgkn6su3gbrhvSWpRoEtkmpq
         679Xyjv1MvscVOpcdOEf0Rwztb9xRU0I2ShsJEoe+QBDQkS4pZjZ9BVYx7z0dFrN9WKo
         awdA==
X-Forwarded-Encrypted: i=1; AL+hErG39Tinj90OZtiBZfm2FgFOIP4RUhaI8BmeCuwC533wGQZvWGEiwXUG0ihdF6usoc9Br/Yiz8kRK40=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pm/zi8Wa5GTmDJrgIi72oVoJI29q/CxPFr4nZvpBbE7gPYFu3
	dnDqWL82HcOC/40NJ5bZQoxPkjEiW6aggZOIApr+4F1ey7pS6saQ2eOtXFvi56AL6modDAF4tGl
	qgRJTlSG1snoZgoiU81QpfmyEfBNGK7FP9AdDcCcbjiVaLtruJHlRflxthg2F4awXdqzgQrv9EH
	TuSykOFgRtD9IdU/pBpGs2d+TYT4TNrZyvxo5sq7PPkarL9iTTnfOqg+fud8/+G9+y7PihXAI5H
	uisW29lxq82lrv8BjG5Ew==
X-Gm-Gg: AZFdTZerRMy13Gp8nQoi46D/6CeSNVjS+c4EMTaSfFwuLmPa3hIu15wvvX7cBt9hCtD
	H6y1HpHCxCgrwJ3cvukn1F04xPGep3nIgdwjDZ4xO47UwhskMDzxZbJYd3kpB3LdSw0WlS/vjt+
	WsSMJUdlVYPudYCNIOHCxeoVhl+vYBC2F54Vl07+20vjR4eC4VGQXbXdewIsN4uDGMj5576CdpI
	hHyZz5FpfDzA2gQPKF+RenpZbxN0WCEcfUM7M40PeqYwGzES9Erpol/DIM5D87ICXPnEPkgBL49
	cWJxMC1vdms6L275Oj/ZKc8unfnP57PIowoB/ffoJDCgV5AGDxtsWrycwiTgsVLvQNChzS2wDrA
	fgh/JQH7OPgzWmGPmUBhKSvKIBuOe1+iNlnSFg+kgX8glGPgdHdsRGpqSkTlKKuDmXA5cpNeiSN
	TA8N8a11M0azUYdLEL6h0Fhd/wmQelQu+emeaRW5U=
X-Received: by 2002:a17:903:19cb:b0:2ed:2c40:6273 with SMTP id d9443c01a7336-2f03f1c08c5mr213729195ad.40.1795697566769;
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f03f0c4be7sm3028685ad.11.2026.11.26.04.52.46
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:52:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso550024785a.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795697565; x=1796302365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVa9ekImbNy0eUOCh+fU0MyKlDIldS/ykE7Tfd4W/ZI=;
        b=gKk47dwT9qsSkXaxT1Qkoy7AvX3GcbtgY82LBcljZKM7OMNoHK7Eqi5N7/QpcYrVGY
         4WNDH6kPzKLsCur9ofxaTHZ6OrLX6nTCb3CnL6xx624o3gfPbzYprrl/HNMU0aNFzt+a
         m42Rw7GtidhNThOrXgh2JFlILAEvPQQ+aPMUM=
X-Forwarded-Encrypted: i=1; AL+hErGot2jGJHbBz1Wk/4zGjCJ24vFX5b+fb0wV7IueCkDyRJ1/B2E9taNvmVndJvgdRjVYT3jS5rQC7d4=@lists.linux.dev
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602882385a.12.1795697565366;
        Thu, 26 Nov 2026 04:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-949ba81a543mr3602878285a.12.1795697564924;
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0c18267esm311983385a.4.2026.11.26.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:52:44 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
Date: Thu, 26 Nov 2026 13:52:40 +0100
Message-ID: <20261126125240.958940-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102122311.181075-2-tristmd@gmail.com>
References: <20261102122311.181075-2-tristmd@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 2 Nov 2026 12:23:10 +0000, Tristan Madani <tristmd@gmail.com> wrote:
> brcmf_sdiod_skbuff_write() rounds skb->len up to the next 4-byte
> boundary and passes the larger size to sdio_memcpy_toio().  The 1-3
> extra bytes come from heap memory past skb->data, leaking stale kernel
> data to the wireless device.
>
> Zero-fill the padding before the SDIO write.
>
> Fixes: 8f13c87ccc49 ("brcmfmac: Split brcmf_sdiod_buffrw function up.")

[...]

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
>  1 file changed, 3 insertions(+)

[...]

> @@ -323,6 +323,9 @@ static int brcmf_sdiod_skbuff_write(struct brcmf_sdio_dev *sdiodev,
>  	req_sz = skb->len + 3;
>  	req_sz &= (uint)~3;
>  
> +	if (req_sz > skb->len)
> +		memset(skb->data + skb->len, 0, req_sz - skb->len);
> +
>  	err = sdio_memcpy_toio(func, addr, ((u8 *)(skb->data)), req_sz);
>  
>  	if (err == -ENOMEDIUM)

The padding lies beyond skb->len, so this memset is only safe when
skb_tailroom(skb) >= req_sz - skb->len, and nothing guarantees that for
the skbs reaching this function (e.g. a data skb in the non-glom path).
If the tailroom is short the memset overwrites skb_shared_info. Please
check the tailroom (brcmf_sdio_txpkt_prep_sg() does so before it adds
tail padding) and handle the short case, e.g. by expanding the tail.

Also, the 4-byte rounding of the length predates the commit in the
Fixes tag, which only split the function up. Please point the tag at
the commit that introduced the rounding. The SDPCM header carries the
unpadded frame length so the device should ignore the padding bytes; a
word on the actual impact and how this was tested would be good.

Regards,
Arend
