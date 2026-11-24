Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551232;
	b=r9N9NAvXG4DtDLWCHjo5pZRUgR2oGyd0jp75e2HDrbfEdh6pQA2hNcDTcJI4VQO7AKJX
	 MtqrbIz5jHBGu8BT13QsYLZLKjuOWHapliht6n1IIy4g3hnbU11Wxq2uqwsW2Xyz+Ikai
	 pOxNHhQRWOhd7oJhmhzFOBmSUM21aIS9AfGRu7SrOR3UFFjeuQ59+ZUKwhQI7saNMSRnt
	 96+KAyHxk40rFek7/toIWw/Ne82gEkl+zh1Rxb4PEzpE3xb40dGFjVPJU6LwgllYwUP0d
	 lacvq73kTtIg+TQSuKKWCZJxeHaK06olmEf5QZDGYagYhYM7xH7sK00P13FhOd9UfpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551232;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
	b=th6U5WPKlQRPIso1EWFZDZt77Yg8RZZPL7vVB2fXn7jlt3xAsAFvn/QYhndlrRxlvU7m
	 l2MiU1zUkpRMnYCI8YTYSXyI558WF0HSPtjLhWgmFv0fY13ugTlh4r4TDSJFqIxu4ouAm
	 oeubhcxy3DSFUWm161cwNyCaneCVtldgJoFr+7Z71hLAWXIPuM6lbxKS7bJDFssY6B/Tx
	 8I4XOvvn9Ki80wxvFt03dDAZBjLu26e75JZlxWKMCTY9e/WmmkRqYDOJ1VJjyyyCLYEWQ
	 7iw0Siz6QzA5SSIU4aLwICfgV3gBrV0i62pvfD9pmZNp9HucccGLkWai5gEAAXqEDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gh4bzm40;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E85606A6B2
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E85606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gh4bzm40
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so2818325a91.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551232; x=1796156032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=gQ4H8hnfuLqlkHH7RtjBL0+hfM9rip1Q8d6tJbY59sShGDXJ2pQRgcWoySgy/uq7hZ
         VBP5HoaFq1XIa1ws0DqM9vMSUKzYBb8zuFQcwll6D4Jv2ObG9+v8z7KFQTKM9BJLCchs
         k1GZRJNWh3vZfNJEmoJzqfMiYOvCwUTmGLWK8pIdClbw/zmixCBOcV2c36QuQYgV5ylv
         i506q1Dqs1R1CYwo/6jpUUu6UOe+otjSBevUBHv4USEZMnRJPM+2boNxv8QqLjW9TOWe
         Io5jYSFKYiQQ2voIrD9nLOIWSUauOxArtyYALI3bXZ9dzIorc7HOYgdSBDekP7vRFlxb
         tN2Q==
X-Forwarded-Encrypted: i=1; AL+hErFXub25jh4wM8k8CUj12gEqDEQnpWqGgOXBcWvBv9cMZCib7CYUHUIPbPa3jhg8BmXMJKaZ4vNHMIc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9YYidA13nkYNQROgM+CZJFgAQ3iW+DxT+1kEjEeZXo8GpXJrC5
	E8Vq2Lp3JO9vaLMyH3BQ7dXhWAtNSQIXwi7oi6r8uwI4IxFr8k6GTUeFtVuveDHZmEi45rKWWgL
	+41OUNyJ67hzRoIyn1REc0jN1a9EyOKK/GILw2mjb9inMxB+HjjLgCq03fSoh+boiuMMwF8+Pu5
	W81+SwBoqr8Ne1ndPFrf+s56RjpZqVFFAahxP9nIUipddDL0zuGDDYW4/YuffXPj+TNNfVdisfy
	B2Iutb86DQrLEYhDEntBg==
X-Gm-Gg: AZFdTZck4nnjR90gaknYQpsGTvoq9U1qjkcTHJaT2kyG9AI0RjoQLE27GSFE5Utac7u
	5YbyZ++FEXBq4QDRMTq6ndNE683q0dBfGIo+ZOgx5dPail8xKorvuVTC4/n8WQRiCMc1p66NReW
	uk51CyJJ/yWgOOIChDRqk+4MfCnnS2zf/HZhIdbsgF7mtFG69Qx1lcRFfR4vn98apyGLezF2Tbp
	R8yzMHGXNFN1MQGyboUJkpn6cMqPtcFymkojI2pIqEb8zfaLTqrAF8TXEDrOEtkLhxoKdTDjwxB
	ckDDBpJujlLsCgb7qICDTnIEjRhmg95dgmh0XfLVZJ5icnMTyEhGubfEM3h4KSSoB7V2V1habbD
	eYmOcGjOdEj4B7RqjMAKcHNGBmA2+QGZKN6YG232K7eKmL7zxvMdxTtwnAHJo5lTVF26VfZULod
	yZ8Fu8KQLTdSdQEM8CDHOdzgRylYHNnQWXvOSIaCw=
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr13367967a91.51.1795551231915;
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffad038sm5198644a91.3.2026.11.24.12.13.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d899e4b4fbso574933137.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551230; x=1796156030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=Gh4bzm40OaqF+9pLMYRCZCAkeFX70ih4hn/eAMTAZly5S+Er0UaqEcuuLUosCAwgj1
         9/Os6Gc4LmlbZdlyOEB9wezwRuwQrBX04ij1Y6gGMLYXwsqzNDMxt6feyu1NWWlwgd8m
         prYJ/WMESDPie/huaJOcNv9QIoN/Tz1BSLPRA=
X-Forwarded-Encrypted: i=1; AL+hErFnhva4MX9xHOGpS2LcefeiRywPGPd1V2+uGKqjfW/6zfnLdLhjOMj6RV2wxH4/hvKETyCtQAkJyuU=@lists.linux.dev
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935573137.37.1795551230446;
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935544137.37.1795551229967;
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Tue, 24 Nov 2026 21:13:44 +0100
Message-ID: <20261124201344.3494326-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-3-maoyixie.tju@gmail.com>
References: <20261115185843.64633-3-maoyixie.tju@gmail.com>
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

On Mon, 16 Nov 2026 02:58:43 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_macdesc_indicate() stores the interface index of a
> MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
> uses it as an index.
>
> 	if_entry = &fws->desc.iface[entry->interface_id];
>
> A device that reports an index of BRCMF_MAX_IFS or more makes this read
> past iface[]. On USB this parser runs with the default module
> parameters. Reject such a signal as
> brcmf_fws_interface_state_indicate() does, and count it as a failed
> update.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged shows the
> out-of-bounds index under UBSAN before this patch, but not after it. No
> hardware was available for testing.
>
> Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
