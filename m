Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776585;
	b=Z/xcOZRhWngkAExxMbiU5PBo5Y/LalIqpMXjFnrVyk1vfn/crJWTPWHzP5upXl+/HyeC
	 jeEe1Ix7zVqadrRSdachrxFcYbZEmourAkHI9AdzYSjvFPgSmK7ha8KuKcRwDlnbCQaJ/
	 px/X2dY/8bbYUEU7JzmOSOKW5GIFRdgcSMLSwhGLMD3o74PCmkbgkeFi0dkVjAjI26/ew
	 VuBfTZd2BTMPbJY1Ff0MRgrgzLtk97tagnS6LrgyD6gPmWaY74ksQVcpOBZ8DmgVazMyu
	 T0xuVU4dmohAbmPAcf3cKAGyiCttILkng2LwGpdy8MARKAAM2x9NBGCYkkWWyPp89NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776585;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
	b=MD83jURx9o1cdduvtFU065ZRaPTuau8DhMyqZp+LJmsUvBQGzb9lycm0F+bKybUc3Wp7
	 drI3JTzzKPIkUZfuJfFW9EKNraXuR/AJm7OqvllM6v0d8X0EJ0HbARtdUFNsb4EoxQ4fl
	 ICF1lDMyF+GzbS9wbpLJscw3KzbEcnZGnooUBHmzQQX8HW9TxIZ1Z34UUVpcvWvc+GiSw
	 qVY/lYus25aa/IAC1gub/f32ndXSk9DjdztejrKVRAGQTzzBkT7k8yh8aoeXew99Cg+Ns
	 YA0cTAWGf+9gIrEdRiLjO0bsoS84dzInljl2jl1hTq8ksd3XugrHrqQddbeQJQWATqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OzS8bQR7;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51107606A337
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51107606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OzS8bQR7
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso974177a12.3
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776584; x=1795381384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=dOhdZq680JlK3fHSA9CISeGMHFuJZDqxOLwvIOMC0spHKyDfTT0+/jwRwKFtF7LKae
         svILXoCU2mYsGgQA/43mmsWNf8je14U6yxjQ4tf7NQWqXVRtOTKlBHHxrg1PWPSV5XD0
         LriygknncKvX3NMACW7/NWfc2kcrh9J439TQPLa3ydctZEW7nhi8h3NgfYRmICtml4x+
         c17L8OpLSrI0QMVTSnccxQTEKYbcDq6F5NrD1aYEyVuMa83wuaim325pgRiE84YMSxPC
         fmxvUNwRdn4HS9kGhm8FaCnZaYFHKen10s6rS5ZbsbeGJ1Kz9Ffyw/aP3phKXqXTHxI4
         gp6Q==
X-Forwarded-Encrypted: i=1; AL+hErHb3YX2EW5cqpYy1Q7yvaNUysMb5Obzka7O1/oqv3ZfU6ExnXaCCCsAX2A8AITyxCBKYypZUtWshC4=@lists.linux.dev
X-Gm-Message-State: APuU4Z86Jp18OEr6SlPpxoZ8zSUMlpxHnVII+i2uLx+2XcKnZujAL6wj
	zOAMTz8b8L21H7WMTqIq/BGU4KysNPh6O7fpnJGPRZA85Cv6GD9L6x8GvIT1rUTcIg6VWGu55+m
	MPNfGh54K+c8Z0ecOtBhYoi/AMsMRh2uhKPKbfzNylzBqaRcScmdbG40KXSLerNnQ9vHU7vl8kD
	MhQIrAh2AIf46sWn4ILfmIx+F9hvGZZvGCWGlTLm9PZRuQXpE/OZiURB8kaKYTzIZYgDB2qhQ0o
	X8vqeVlKyPbyIvNBuDDcA==
X-Gm-Gg: AYBFou3tU6NGbNwHaFyxYoIITZLx0JM8cdwgYBrzM15mHrKi5zvZ2vpmAz4zWicrggl
	ihK6n2A2E2+FRjlzsloiIEYlQABeqq62PWkuF0piycMcKMllqTBCw7YSkcXX7q4OL2FVGTOqjG+
	tDqmuwMKy+t3kfkAIJnUjER0bg4mipPmQUpTHjZBX589ZCDLVt3oBWbMDw9pu+V84CF0jA2FRq3
	6/I18438mKwsb8mpGn1k5rOAiyddDe4XXWIcYENaeJu6ssT4dOmKAqPbOv68uDrV6YdO3BQVnbY
	PlZq5cPKl8l1RJelSUxVOIhfispo+4vmvktzvLgh+SJCewz+HuIxalj5zt7irB85jicnQTum73b
	0Pbu73WPq247rkiSt1dMKVc9edUW182bKRW8Q6IuKBaCubBLs8j15uMM+snkUiqhLiRZ9/ImncL
	K3U0ML/+nbYQtauWfqfH7r8fefTRg4v6hdRwxzlP8=
X-Received: by 2002:a17:90b:5910:b0:3b0:aaed:48d0 with SMTP id 98e67ed59e1d1-3b1b0b4d0d0mr7579776a91.37.1794776583382;
        Sun, 15 Nov 2026 13:03:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0b6asm12808438a91.4.2026.11.15.13.03.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1162853eec.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776580; x=1795381380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=OzS8bQR7R9cAYiM4IuyUnJ+pbw1PyaV/r1Y1Z7OHNN7smZxZzJ/gqjPGHzyoJ/jN3x
         3iH3l8rfbP9T43im/cVeP1FwLFboMbQuuFHDHPZbWMN9gq4C+nQi4ddMPEpNBHlK78S1
         B8K42Ov0qo4V1mf6PKqRZ/2EwhGRtFkd2590k=
X-Forwarded-Encrypted: i=1; AL+hErEmy6Rb3DjM4lMx9zmMArSPeAx4uBL/sltC/gQpKWPpjo9JMWP5uD7Eern7ScmngqkYi/ImgQgILMg=@lists.linux.dev
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649110eec.21.1794776579907;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649084eec.21.1794776579210;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:02:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Sun, 15 Nov 2026 22:02:49 +0100
Message-ID: <20261115210253.883721-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009072232.18-1-shxzhaosr@163.com>
References: <20261009072232.18-1-shxzhaosr@163.com>
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

On Fri, 9 Oct 2026 15:22:32 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Verified against wireless.git main (fd4e7f1137291), the current
> wireless fixes tree.
>
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Nit: as this is a fix, please consider adding a Fixes tag, which looks to be
9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read"),
and Cc: stable if you want it in the wireless tree.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
