Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922320;
	b=quQ+jkD3lv/5Fz6lPhqK6Q4qOa43Y7VP7cU6X9kZ41+aR23f/SzhD67Yep15LPA5pANi
	 2K/EavqwRi19dsncjgQzbQPGekUgOoL4dOLAj0LBV+K3SXmIiv38qJMZqQ9RIfydZRUYP
	 INw+pGRFnoBxtizNLTnDRXB/55sCtwwB8O7AByQFSHVccCXVkbuqlcgHBUiVSdQ0HxATX
	 u3pqGkPZtopoG5zHqaek5NLaOcvwrGwqjLtvmezgn1k/kFDPs/q6j+ZncH5r0HM6W1oqb
	 WepzLtZ0YszxW+Ac4xE9S97FQKOMw/kkhmgOhzG/0yA7BRSNTX0rrUSoGx+oObcMKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922320;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
	b=MT4W7xuZ47SBzAoBYravR/Ur4CWNkVRCjU4CtBLLLTxSVF8AG7AfwtW3b+6GhqgHcdKl
	 k1uLwlhG6FbVaH4vAivGwtzuDJfQH7DnUXrrcHsjk2Nt32uGjIcbT3Kni1Qu4ApgCMim7
	 7R0GNvfq5UGJvGjy6P3YARFpZcxe1xcqNmvadtRxWF9eetO0oJJBgu+ysLvU2n5z3lxUD
	 pXzF/TF+KM1CCle9XgONUrBLbg8gImIxNBR0wAw7T6/e/8kCkLc6vcAnoPRXs/VGO0Nwc
	 NB+lR/h6dW/VRGP10A0AVXLp4T1HwMJcLsxiPtlCBKX1GGQGS0Xi84EAtPrPCbzAj6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cVUBuHok;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F41606A31C
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 13:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F41606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cVUBuHok
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso638281a91.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 05:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922319; x=1795527119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=jJbDxc8ZikVK7AUiZoKonqyAnwggh09p/U/H2CP0oiJuciPkxH4nWLC5KlYAkCjBo1
         4OVF62hmjar9z2zBk2M9X9scrhGZq5DjvTcfVnUBf37dGydNkoQ3BUluSireXlAkncqz
         RZ9Ll4aUi02c2+eYKV8Gn327WyFK29gHFL64KEkenuv6/xfjyqoJxV4xD8mhNM41zfe2
         wVhE9JxXexc2IzSYEonVdkdKBcBvyrTkk/nPjPL0nGlXFYLKS5SL8tP1ouhCQNk6oQvr
         eP4FgZL0r/Ijq8E6V+v4kw2BoUapR9zW/HfO6YrXdnAc43wNcHQrGrOs0rh0LH9O8nrF
         2cVw==
X-Forwarded-Encrypted: i=1; AL+hErHdZCb86d74o4Vpsg5n9O5pTZ/rRdeR9PMI9TmMVZZGoNfduHjJhlJpa9YT1esc0HpPQ3dGGduVI1c=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gXO1x/uacZ6DbH9wnOQvYWbqqVXm6w9Y+W32MXypzWj883OaK
	FtHcAGolLKkILSzpkDX6gVtTElv9QLyN5Jb9TMumKKyhmYhnXpfk9GfaWbq+aGUD1mXXc5Yj75p
	0Wb62rqg0KmL3980kszZ0ZQZ3RfGEVrnhSh4+NygdtJBaXxtzPk36JaketNYQ71NZ3Y+is77hIk
	UmSdvr+Nqsr9uAuWv0ByWJO+B48LWA4AcwwKwECXlpbBhJlRShFDeW4G/qWMOVhRhFHeW6eGomD
	wUd7/zK7rxH3+vzjvpeuQ==
X-Gm-Gg: AZFdTZfoycWyVTOj71HtmeOn1jwEBMlQbVH2r/zrT/DieB5pqKVFJ9YDeADn1ikHjFh
	20MTNbFp4LsDuATsXk2MFKyLqXh0kb/yIZpeL1YpcKHLEofwmGmUXVJcbdmZjmZyUkDffjl0QGk
	Bu9eIEJroSZakI6AjXy9VBdlLWZK5XtjTQ9O+O+H5HXGIXYxGDfPdNjfb9NzQalhX+d4t++C94z
	0ybdQXFYVmZVhCIhOPMKMLddsR2qZ7RX0SQZdnc0iBbOQcB7kYRCtkoRHUzyx9+KBNU4h+/HOk/
	hyVEj4krJoIy2meeisF7BVWo/PqY2nvRTB5N1YB/EiOPyJoQTinz3hF+gcIO5h5oh/x1k/97DGX
	GAgJ0Bntv8pkT31b8R/9TytTESryaZ6hWTG2jec3Oqelc6d8t/yJtLgHR0Ty5HliwCCDrJDrXdC
	558jXGZx+pyL8T/0iNJaKA6YTbvqu1k/Ej3RP0LAEoXQ==
X-Received: by 2002:a17:90b:4c4e:b0:3b3:a763:555a with SMTP id 98e67ed59e1d1-3b3ac26d0famr2110978a91.36.1794922318626;
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cddc160bc5csm227099a12.2.2026.11.17.05.31.57
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961ed97d6so179560185a.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794922317; x=1795527117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD6TBLmK/IIZSnjK7MAJYBAkHQUcSU3Vb9rupdsZ2as=;
        b=cVUBuHokPkfTyRfQPagNII4Af667dlMZ2UoFTabfcqjlMqr21h/VDwEqVXWL8Q86Rv
         Ej3V/pTbgITEt2fcw4aVh7dAiytUNc6PxvM/WDy9yW6gDdYmNcnRrFjFPRcznkshST43
         Gt5T9ODwgRCc4mnpAGSQtNda6e0RmSP8NA00k=
X-Forwarded-Encrypted: i=1; AL+hErHjBr2yQJy2fggJduvbleE/usg8hX7nQzXAC6c6R0FnRtzSIXGQ9yEpiFfOS70udRHU4nD4zvjXFl0=@lists.linux.dev
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385557585a.32.1794922317175;
        Tue, 17 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:93e:c853:fc07 with SMTP id af79cd13be357-9498b826e55mr385552685a.32.1794922316505;
        Tue, 17 Nov 2026 05:31:56 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8fd141sm1094292085a.43.2026.11.17.05.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:31:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in brcmf_fw_alloc_request()
Date: Tue, 17 Nov 2026 14:31:50 +0100
Message-ID: <20261117133150.817227-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
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

On Tue, 13 Oct 2026 17:55:52 -0700, Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:
> From: Bill Wendling <morbo@google.com>
>
> brcmf_fw_alloc_request() constructs firmware file paths by chaining
> strscpy() and multiple strlcat() calls for the module parameter path,
> separator, base name, and extension.
>
> In preparation for removing the deprecated strlcat() API[1], format the
> complete firmware path in a single snprintf() call.
>
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM

Is this Cc: line necessary? Can you clarify its purpose? No need to clarify
in the commit message. Just an email response will do.

The Assisted-by: tag shows this change was produced with an LLM. Please
follow the guidelines in Documentation/process/generated-content.rst so
it is clear what was tool generated and what tool and/or LLM was used.

[...]

>  	for (j = 0; j < n_fwnames; j++) {
> -		fwreq->items[j].path = fwnames[j].path;
> -		fwnames[j].path[0] = '\0';
>  		/* check if firmware path is provided by module parameter */
>  		if (brcmf_mp_global.firmware_path[0] != '\0') {
> -			strscpy(fwnames[j].path, mp_path,
> -				BRCMF_FW_NAME_LEN);
> -
> -			if (end != '/') {
> -				strlcat(fwnames[j].path, "/",
> -					BRCMF_FW_NAME_LEN);
> -			}
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
> +				 mp_path, (end == '/') ? "" : "/",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
> +		} else {
> +			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
> +				 mapping_table[i].fw_base,
> +				 fwnames[j].extension);
>  		}
> -		strlcat(fwnames[j].path, mapping_table[i].fw_base,
> -			BRCMF_FW_NAME_LEN);
> -		strlcat(fwnames[j].path, fwnames[j].extension,
> -			BRCMF_FW_NAME_LEN);
>  		fwreq->items[j].path = fwnames[j].path;
>  	}

Please address Kees' comment and collapse this into a single snprintf().
Note mp_path points to the firmware_path array so it can never be NULL; an
empty mp_path simply prints nothing, so something like the following would do:

	snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s", mp_path,
		 (mp_path_len && end != '/') ? "/" : "",
		 mapping_table[i].fw_base, fwnames[j].extension);

Regards,
Arend
